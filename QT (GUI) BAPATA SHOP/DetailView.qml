import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: detailView
    property var productData: ({})

    header: ToolBar {

        Row {
            spacing: 10
            anchors.fill: parent

            // 1. Tombol Back Manual
            Button {
                text: "<"
                width: 40
                height: 40
                onClicked: {
                    detailView.StackView.view.pop()
                }
            }

            // 2. Judul Halaman
            Label {
                text: productData.name
                font.pointSize: 16
                elide: Text.ElideRight
                verticalAlignment: Text.AlignVCenter
                leftPadding: 5
                width: parent.width - 55
            }
        }
    }

    ScrollView {
        anchors.fill: parent
        anchors.margins: 15

        ColumnLayout {
            width: parent.width - 30
            spacing: 15

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 300
                color: "#CCCCCC"

                Text {
                    anchors.centerIn: parent
                    text: "📷 Foto Produk"
                    font.pixelSize: 20
                }
            }

            Text {
                text: productData.name
                font.pointSize: 24
                font.bold: true
                Layout.fillWidth: true
            }

            Text {
                text: "Harga: Rp " + productData.price.toLocaleString("id-ID")
                color: "red"
                font.pointSize: 18
                font.bold: true
                Layout.fillWidth: true
            }

            Label {
                text: "### Deskripsi Produk\n\n" + productData.description
                wrapMode: Label.Wrap
                Layout.fillWidth: true
            }

            Button {
                text: "🛒 Tambah ke Keranjang"
                Layout.alignment: Qt.AlignHCenter
                onClicked: {
                    console.log("Menambahkan " + productData.name + " ke keranjang!")
                }
            }
        }
    }
}
