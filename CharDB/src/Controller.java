import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TabPane;
import javafx.scene.control.TextField;

public class Controller {

    ObservableList<String> inputSearchCategories = FXCollections.observableArrayList("Character firstname",
            "Character lastname", "Character alias", "Game title", "Game company");

    @FXML
    private void initialize() {
        inputSearchComboBox.setItems(inputSearchCategories);
    }

    @FXML
    private TabPane tabPane;

    @FXML
    private ComboBox<String> inputSearchComboBox;

    @FXML
    private TextField inputSearchTextField;

    @FXML
    private Label inputSearchLabel;

    @FXML
    void searchClick(ActionEvent event) {

    }

}
