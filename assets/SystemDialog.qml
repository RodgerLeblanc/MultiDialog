import bb.cascades 1.3
import bb.system 1.2

Container {
    property alias title: systemListDialog.title
    property alias body: systemListDialog.body
    property variant listOfItemsToAppend: []

    function show() {
        systemListDialog.show()        
    }

    signal resultList(string selectedItem)
         
    onListOfItemsToAppendChanged: {
        for(var i = 0; i < listOfItemsToAppend.length; i++) {
            systemListDialog.appendItem(listOfItemsToAppend[i])
        }
    }
    attachedObjects: [
        SystemListDialog {
            id: systemListDialog
            confirmButton.label: "Ok"
            cancelButton.label: "Cancel"
            onFinished: {
                if (result == SystemUiResult.ConfirmButtonSelection) {
                    resultList(listOfItemsToAppend[selectedIndices])
                } else if (result == SystemUiResult.CancelButtonSelection) {
                    cancel()
                    clearButtons();
                }
            }
        }
    ]
}
