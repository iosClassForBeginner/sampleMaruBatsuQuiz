# 第19回: １時間でiPhoneアプリを作ろう
## マルバツクイズアプリ

<img src=https://github.com/iosClassForBeginner/sampleMaruBatsuQuiz/blob/master/Assets/sample.png width=400px>
  
  当アカウントへ訪れていただき、誠にありがとうございます。第19回アプリ教室では、マルバツクイズアプリを作ります。自分のペースで勉強したい、勉強前に予習したい、内容を復習したい場合、ご利用ください。
  
## アプリ教室に興味ある方、歓迎します。  
  Meetup  
  http://www.meetup.com/ios-dev-in-namba/
  
## 別途アプリ教室(有料)も開いております  
  http://learning-ios-dev.esy.es/  

## 問い合わせ
  株式会社ジーライブ
  http://geelive-inc.com  

## アプリ作成手順

#### 0, 開発準備
> 0-1. xcodeで新規プロジェクトを立ち上げる
<img src="https://raw.githubusercontent.com/iosClassForBeginner/XcodeHowToImage/master/Assets/create_new_project.gif" width="320px">

#### 1, Storyboardで、アプリのデザイン
> 1-1. main.storyboardを選択し、UI部品から下記を配置します。(ドラッグ&ドロップ)
- UITextView 問題表示
- UILabel 結果出力
- UIButton 次の問題
- UIButton マルボタン
- UIButton バツボタン
![image](https://raw.githubusercontent.com/iosClassForBeginner/XcodeHowToImage/master/Assets/set_uilabel.gif)
![image](https://raw.githubusercontent.com/iosClassForBeginner/XcodeHowToImage/master/Assets/set_button.gif)

> 1-2. Storyboardの下記UI部品を、ViewController.swiftに紐づけます（control押しながらドラッグ）
- UITextView 問題表示
- UILabel 結果出力
- UIButton 次の問題 (actionで紐付ける)
- UIButton マルボタン (actionで紐付ける)
- UIButton バツボタン (actionで紐付ける)

![image](https://raw.githubusercontent.com/iosClassForBeginner/XcodeHowToImage/master/Assets/tying_button_action.gif)
![image](https://raw.githubusercontent.com/iosClassForBeginner/XcodeHowToImage/master/Assets/tying_textfield.gif)
![image](https://raw.githubusercontent.com/iosClassForBeginner/XcodeHowToImage/master/Assets/tying_uilabel.gif)

#### 2, ViewController.swiftにコード記述
- 以下コードブロックを記入
  
```Swift
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var quizView: UITextView!
    @IBOutlet weak var resultLabel: UILabel!
    
    let quizzes:[(quiz:String, answer:Bool)] = [
        ("1+1は2である", true),
        ("日本の人口は1億人以下である", false),
        ("テトリス（ゲーム）を開発したのは、日本人である", false),
        ("生きている間は、有名な人であっても広辞苑に載ることはない", true)
    ]
    var no = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        quizView.text = quizzes[no].quiz
        resultLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func maru(_ sender: UIButton) {
        if (quizzes[no].answer) {
            resultLabel.text = "正解"
        } else {
            resultLabel.text = "不正解"
        }
    }

    @IBAction func batsu(_ sender: UIButton) {
        if (!quizzes[no].answer) {
            resultLabel.text = "正解"
        } else {
            resultLabel.text = "不正解"
        }
    }

    @IBAction func next(_ sender: UIButton) {
        no = no + 1
        if quizzes.count <= no {
            no = 0
        }
        quizView.text = quizzes[no].quiz
        resultLabel.text = ""
    }

}

```
