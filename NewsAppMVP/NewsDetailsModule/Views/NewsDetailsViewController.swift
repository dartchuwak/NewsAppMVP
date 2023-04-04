
import UIKit
import SnapKit

final class NewsDetailsViewController: UIViewController {
    
    var presenter: NewsDetailsViewPresenterProtocol!
    
    let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        imageView.backgroundColor = .black
        return imageView
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 1
        return label
    }()
    
    let likeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(systemName: "heart")
        return imageView
    }()
    
    let postTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 3
        return label
    }()
    
    let postTextLabel: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13, weight: .regular)
       // label.numberOfLines = 0
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Article"
        view.backgroundColor = .white
        addViews()
        layoutViews()
        presenter.setArticle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func addViews() {
        view.addSubview(postImageView)
        view.addSubview(postTitleLabel)
        view.addSubview(postTextLabel)
        view.addSubview(stackView)
        stackView.addArrangedSubview(dateLabel)
    }
    
    private func layoutViews() {
        postImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.width.equalToSuperview()
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(260)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(postImageView.snp.bottom).inset(-15)
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
        postTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).inset(-11)
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
        postTextLabel.snp.makeConstraints { make in
            make.top.equalTo(postTitleLabel.snp.bottom).inset(-8)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(-8)
        }
    }
}

extension NewsDetailsViewController: NewsDetailsViewControllerProtocol {
    func setArticle(article: Article?) {
        self.postTitleLabel.text = article?.title
        self.dateLabel.text = article?.publishedAt
        
        self.postTextLabel.text = article?.description
        if let URLString = article?.urlToImage {
            guard let url = URL(string: URLString) else { return }
            self.postImageView.sd_setImage(with: url)
        }
    }
    
    
}
