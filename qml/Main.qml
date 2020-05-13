import QtQuick 2.9
import Ubuntu.Components 1.3
import Morph.Web 0.1
import QtWebEngine 1.7

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'esviji.cibersheep'
    automaticOrientation: true
    anchorToKeyboard: false

    width: units.gu(45)
    height: units.gu(75)

    Page {
        id: page

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        header: PageHeader {
            visible: false
        }

        WebContext {
            id: webcontext
        }

        WebView {
            id: webview

            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }

            // TODO error page
            context: webcontext
            url: 'www/index.html'

            //settings.allowRunningInsecureContent: true

            Component.onCompleted: {
                settings.localStorageEnabled = true
            }

        }

        ProgressBar {
            height: units.dp(3)
            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
            }

            showProgressPercentage: false
            value: (webview.loadProgress / 100)
            visible: (webview.loading && !webview.lastLoadStopped)
        }
    }
}
