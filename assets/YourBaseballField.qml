import bb.cascades 1.3

Container {
    horizontalAlignment: HorizontalAlignment.Center
    property alias labelText: label.text
    
    ImageButton {
        defaultImageSource: "asset:///images/baseball_field.gif"
        onClicked: {
            systemDialog.title = "Test"
            systemDialog.body = "Choose something"
            systemDialog.listOfItemsToAppend = ["1", "2", "3"]
            systemDialog.show()
        }
    }
    Label {
        id: label        
    }
    attachedObjects: [
        SystemDialog {
            id: systemDialog
            onResultList: {
                console.log("Returned : " + selectedItem)
                labelText = selectedItem
            }
        }
    ]
}
