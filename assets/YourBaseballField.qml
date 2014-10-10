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
                if (selectedItem == "1") {
                    systemDialog1.title = "Test1"
                    systemDialog1.body = "Choose something1"
                    systemDialog1.listOfItemsToAppend = ["11", "12", "13"]
                    systemDialog1.show()                    
                }
                if (selectedItem == "2") {
                    systemDialog2.title = "Test2"
                    systemDialog2.body = "Choose something2"
                    systemDialog2.listOfItemsToAppend = ["21", "22", "23"]
                    systemDialog2.show()                    
                }
                if (selectedItem == "3") {
                    systemDialog3.title = "Test3"
                    systemDialog3.body = "Choose something3"
                    systemDialog3.listOfItemsToAppend = ["31", "32", "33"]
                    systemDialog3.show()                    
                }
            }
        },
        SystemDialog {
            id: systemDialog1
            onResultList: {
                console.log("Returned : " + selectedItem)
                labelText = selectedItem
            }
        },
        SystemDialog {
            id: systemDialog2
            onResultList: {
                console.log("Returned : " + selectedItem)
                labelText = selectedItem
            }
        },
        SystemDialog {
            id: systemDialog3
            onResultList: {
                console.log("Returned : " + selectedItem)
                labelText = selectedItem
            }
        }
    ]
}
