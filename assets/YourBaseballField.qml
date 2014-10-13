import bb.cascades 1.3

Container {
    horizontalAlignment: HorizontalAlignment.Center
    property alias labelText: label.text

    onLabelTextChanged: {
        diamond.defaultImageSource = "asset:///images/" + labelText.toLowerCase() + (labelText == "vide" ? ".gif" : ".png")
    }   
     
    ImageButton {
        id: diamond
        defaultImageSource: "asset:///images/baseball_field.gif"
        onClicked: {
            systemDialog.title = "Test"
            systemDialog.body = "Choose something"
            systemDialog.listOfItemsToAppend = ["Hit!", "HomeRun!", "Nothing!"]
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
                if (selectedItem == "Hit!") {
                    systemDialog1.title = "Test1"
                    systemDialog1.body = "Choose something1"
                    systemDialog1.listOfItemsToAppend = ["Simple", "Double", "Triple"]
                    systemDialog1.show()                    
                }
                if (selectedItem == "HomeRun!") {
                    systemDialog2.title = "Test2"
                    systemDialog2.body = "Choose something2"
                    systemDialog2.listOfItemsToAppend = ["Homerun"]
                    systemDialog2.show()                    
                }
                if (selectedItem == "Nothing!") {
                    systemDialog3.title = "Test3"
                    systemDialog3.body = "Choose something3"
                    systemDialog3.listOfItemsToAppend = ["Vide"]
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
