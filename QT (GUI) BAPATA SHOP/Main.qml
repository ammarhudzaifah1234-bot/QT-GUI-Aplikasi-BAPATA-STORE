import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: mainWindow
    width: 800
    height: 600
    visible: true
    title: qsTr("BAPATA ONLINE SHOP")

    // Data Produk (Anda sudah perbarui data ini)
    property var products: [
        { name: "Pempek Adaan", price: 10000, description: "Pempek dengan isian daun baawang." },
        { name: "Pempek Kapal Selam", price: 25000, description: "Pempek lemak dengan isi telur dan berukuran jumbo." },
        { name: "Pempek Lenjer", price: 4500, description: "Pempek Besak yang membuat perut kenyang." },
        { name: "Kaos Jogja", price: 350000, description: "Kaos limited khas jogja." },
        { name: "Payung Tasik", price: 550000, description: "Payung Kertas tradisional Tasikmalaya." },
        { name: "Terompah Tasik", price: 1000000, description: "Terompah tradisional elegan dan keren,." },
        { name: "Batik Palembang", price: 120000, description: "batik khas dengan corak palembang." },
        { name: "Raket Badminton", price: 300000, description: "YONEX 1922 Pro Ultra." },
        { name: "Mie Ayam Bantul", price: 120000, description: "Siapa yang ga suka mie ayam?." },
        { name: "Manusia", price: 6666666666666, description: "----Error Not Found----." },
        { name: "Bantuan untuk sumatera", price: 100000000, description: "seikhlasnya aja." },
        { name: "Shark", price: 99999999, description: "A" }
    ]

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: homePage

        Component {
            id: homePage
            Page {
                title: "Semua Produk"

                GridView {
                    id: productGrid
                    anchors.fill: parent

                    // PERBAIKAN 1: mainWindow sekarang terdefinisi
                    cellWidth: mainWindow.width / 4
                    cellHeight: 250
                    model: mainWindow.products

                    delegate: ItemDelegate {
                        width: productGrid.cellWidth
                        height: productGrid.cellHeight

                        ColumnLayout {
                            width: parent.width
                            spacing: 5
                            // HAPUS padding: 5 dari ColumnLayout (Penyebab error)

                            Rectangle {
                                // Gunakan margins untuk memberi ruang (pengganti padding)
                                Layout.margins: 5
                                Layout.fillWidth: true
                                Layout.preferredHeight: productGrid.cellHeight - 60
                                color: "#EEEEEE"
                                border.color: "#AAAAAA"
                                border.width: 1

                                Text {
                                    anchors.centerIn: parent
                                    text: "🖼️\nGambar\n(" + model.modelData.name + ")"
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pixelSize: 12
                                }
                            }

                            Text {
                                text: model.modelData.name
                                font.pointSize: 11
                                font.bold: true
                                elide: Text.ElideRight
                                Layout.fillWidth: true
                                Layout.leftMargin: 5 // Tambahkan margin di kiri
                                Layout.rightMargin: 5 // Tambahkan margin di kanan
                            }

                            Text {
                                text: "Rp " + model.modelData.price.toLocaleString("id-ID")
                                color: "red"
                                font.pointSize: 10
                                Layout.fillWidth: true
                                Layout.leftMargin: 5
                                Layout.rightMargin: 5
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                stackView.push(detailPage, { productData: model.modelData })
                            }
                        }
                    }
                }
            }
        }

        Component {
            id: detailPage
            DetailView {}
        }
    }
}
