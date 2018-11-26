
import UIKit

class EmployeeDetailTableViewController: UITableViewController, EmployeeTypeDelegate {
    
    struct PropertyKeys {
        static let unwindToListIndentifier = "UnwindToListSegue"
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var employeeTypeLabel: UILabel!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    
    @IBAction func birthdayDatePickerValueChanged(_ sender: Any) {
        dobLabel.text = formatDate(date: birthdayDatePicker.date)
    }
    
    var employee: Employee?
    var employeeType: EmployeeType?
    
    var birthdayRow = 1
    var birthdayPickerRow = 2
    var defaultRowHeight: CGFloat = 44
    
    var isEditingBirthday: Bool = false {
        didSet {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {
        if let employee = employee {
            navigationItem.title = employee.name
            nameTextField.text = employee.name
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dobLabel.text = dateFormatter.string(from: employee.dateOfBirth)
            dobLabel.textColor = .black
            employeeTypeLabel.text = employee.employeeType.description()
            employeeTypeLabel.textColor = .black
        } else {
            navigationItem.title = "New Employee"
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let name = nameTextField.text,
            let employeeType = employeeType {
            employee = Employee(name: name, dateOfBirth: birthdayDatePicker.date, employeeType: employeeType)
            performSegue(withIdentifier: PropertyKeys.unwindToListIndentifier, sender: self)
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        employee = nil
        performSegue(withIdentifier: PropertyKeys.unwindToListIndentifier, sender: self)
    }
    
    //////////////////////
    // MARK: TableView //
    ////////////////////
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.row == birthdayPickerRow else { return defaultRowHeight }
        if isEditingBirthday {
            
            return birthdayDatePicker.frame.height
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard indexPath.row == birthdayRow else { return }
        
        isEditingBirthday = !isEditingBirthday
        dobLabel.textColor = .black
        dobLabel.text = formatDate(date: birthdayDatePicker.date)
    }
    
    ////////////////////////
    // MARK: misc. Funcs //
    //////////////////////
    
    func didSelect(employeeType: EmployeeType) {
        self.employeeType = employeeType
        employeeTypeLabel.text = employeeType.description()
        employeeTypeLabel.textColor = .black
    }
    
    func formatDate (date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let employeeTypeTableViewController = segue.destination as? employeeTypeTableViewController else {return}
        employeeTypeTableViewController.employeeType = employee?.employeeType
        employeeTypeTableViewController.delegate = self
    }
}
