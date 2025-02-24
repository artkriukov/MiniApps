//
//  ChatView.swift
//  FlashChat
//
//  Created by Artem Kriukov on 21.02.2025.
//

import UIKit
import Firebase

class ChatView: UIView {
    
    let db = Firestore.firestore()

    // MARK: - UI
    private let tableView = UITableView()
    
    private lazy var containerView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(named: K.BrandColors.purple)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var messageTF: UITextField = {
        let element = UITextField()
        element.backgroundColor = .white
        element.borderStyle = .roundedRect
        element.placeholder = "placeholder"
        element.textColor = UIColor(named: K.BrandColors.purple)
        element.tintColor = UIColor(named: K.BrandColors.purple)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var enterButton: UIButton = {
        let element = UIButton(type: .system)
        element.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        element.addTarget(self, action: #selector(tappedEnterButton), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var messages = Message.getMessages()
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        setDelegate()
        setupViews()
        setupConstraints()
        loadMessages()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc private func tappedEnterButton() {
        
        if let messageBody = messageTF.text {
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.bodyField: messageBody,
                K.FStore.dateField: Date().timeIntervalSince1970
            ]) { error in
                if let e = error {
                    print(e)
                }else {
                    print("Good job!")
                }
            }
        }
    }
    
    func loadMessages() {
        self.messages = []
        
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { querySnapshot, error in
            
            self.messages = []
            
            if let e = error {
                print("Problem")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageBody = data[K.FStore.bodyField] as? String {
                            let newMassge = Message(sender: .me, body: messageBody)
                            self.messages.append(newMassge)
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
    
    
}

private extension ChatView {
    func setupViews() {
        backgroundColor = UIColor(named: K.BrandColors.purple)
        tableView.register(MessageCell.self, forCellReuseIdentifier: K.cellIdentifier)
        tableView.backgroundColor = .white
        addSubview(tableView)
        
        addSubview(containerView)
        containerView.addSubview(messageTF)
        containerView.addSubview(enterButton)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide)
        }
        
        containerView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(tableView.snp.bottom)
            make.height.equalTo(60)
        }
        
        messageTF.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(20)
        }
        
        enterButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(20)
            make.leading.equalTo(messageTF.snp.trailing).offset(20)
            make.height.width.equalTo(40)
        }
    }
}

extension ChatView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as? MessageCell else { fatalError() }
        
        let model = messages[indexPath.row]
        cell.configure(model: model)
        
        return cell
    }
}
