import QtQuick 2.6
import QtQuick.Controls 2.0 as Controls
import QtQuick.Layouts 1.2
import org.kde.kirigami 2.13 as Kirigami

import BloopModels 1.0

// Base element, provides basic features needed for all kirigami applications
Kirigami.ApplicationWindow {
	// ID provides unique identifier to reference this element
	id: root
	
	// Window title, qsTr will make this string available for translation
	title: qsTr("Feed")


	Component {
		id: postDelegate
		Kirigami.AbstractCard {
		    // contentItem property includes the content to be displayed on the card
		    contentItem: Item {
			Controls.Label {
			    Layout.fillWidth: true
			    // Word wrap makes text stay within box and shift with size
			    wrapMode: Text.WordWrap

			    // "display" is Role to be used.
			    text: model.display
			    visible: true
			}
		    }
		}
	}

    	// Initial page to be loaded on app load
	pageStack.initialPage: Kirigami.ScrollablePage {
		// Title for the current page, placed on the toolbar
		title: qsTr("Bloop")
		
		// List view for card elements
		Kirigami.CardsListView {
			id: layout
			// Model contains info to be displayed
			model: FeedModel { }
			// Delegate is how the information will be presented in the ListView
			delegate: postDelegate
		}
	}
}

