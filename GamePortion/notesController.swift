
import UIKit

class notesController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewBC: NSLayoutConstraint!
    @IBOutlet weak var homeButton: UIButton!
    
    let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(tapDone))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self;
        self.navigationItem.titleView = homeButton;
        
        doneButton.isEnabled = false;
        self.navigationItem.rightBarButtonItem = doneButton;
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyBoardWillShow(notification:)),
            name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyBoardWillHide(notification:)),
            name: NSNotification.Name.UIKeyboardWillHide, object: nil)
       
    }
    
    @objc func keyBoardWillShow(notification: Notification){
        doneButton.isEnabled = true;
        if let userInfo = notification.userInfo as? Dictionary<String, AnyObject>{
            let frame = userInfo[UIKeyboardFrameEndUserInfoKey];
            let keyBoardRect = frame?.cgRectValue
            if let keyBoardHeight = keyBoardRect?.height{
                self.textViewBC.constant = keyBoardHeight
            }
        }
        print("KeyBoard UP");
        
    }
    
    @objc func keyBoardWillHide(notification: Notification){
        doneButton.isEnabled = false;
        self.textViewBC.constant = 0;
        print("KeyBoard DOWN");
        
    }
    
    func textView (_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text:String) ->Bool {
        
        if (text == "" && range.length > 0){
            UserDefaults.standard.set(String(textView.text.dropLast()), forKey: "userInput");
            print("backspace");
        }else{
            
            UserDefaults.standard.set((textView.text + text), forKey: "userInput");
            print("any character");
        }
        return true
    }
    
    override func viewDidAppear(_ animated: Bool){
        print("hi");
        if let x = UserDefaults.standard.object(forKey: "userInput") as? String{
            textView.text = x
        }
        print(textView.text);
    }
    
    @objc func tapDone(){
        //textView.frame.size = CGSize(width: textView.frame.size.width, height: CGFloat(height1))
        textView.resignFirstResponder();
        
    }
    
    @IBAction func homePressed(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true);
    }
  
}
