/*
    SPDX-FileCopyrightText: 2012 Viranch Mehta <viranch.mehta@gmail.com>
    SPDX-FileCopyrightText: 2012 Marco Martin <mart@kde.org>
    SPDX-FileCopyrightText: 2013 David Edmundson <davidedmundson@kde.org>

    SPDX-License-Identifier: LGPL-2.0-or-later
*/

import QtQuick 2.0
import org.kde.plasma.plasmoid 2.0
import QtQuick.Layouts 1.1

import org.kde.plasma.core 2.0 as PlasmaCore

Item {
    id: analogclock

    width: PlasmaCore.Units.gridUnit * 15
    height: PlasmaCore.Units.gridUnit * 15

    property int hours
    property int minutes
    property int seconds
    property int tzOffset

    property bool showSecondHand: Plasmoid.configuration.showSecondHand
    property bool showMinuteHand: Plasmoid.configuration.showMinuteHand
    property bool showHourHand: Plasmoid.configuration.showHourHand

    property bool show12: Plasmoid.configuration.show12
    property bool show3: Plasmoid.configuration.show3
    property bool show6: Plasmoid.configuration.show6
    property bool show9: Plasmoid.configuration.show9
    
    property bool showBigTicks: Plasmoid.configuration.showBigTicks
    property bool showSmallTicks: Plasmoid.configuration.showSmallTicks

    Plasmoid.backgroundHints: "NoBackground";
    Plasmoid.preferredRepresentation: Plasmoid.compactRepresentation

    Plasmoid.toolTipMainText: Qt.formatDate(dataSource.data["Local"]["DateTime"],"dddd")
    Plasmoid.toolTipSubText: Qt.formatTime(dataSource.data["Local"]["DateTime"],  Qt.locale().timeFormat(Locale.LongFormat)) + "\n" +
        Qt.formatDate(dataSource.data["Local"]["DateTime"], Qt.locale().dateFormat(Locale.LongFormat).replace(/(^dddd.?\s)|(,?\sdddd$)/, ""))

    PlasmaCore.DataSource {
        id: dataSource
        engine: "time"
        connectedSources: "Local"
        interval: showSecondHand ? 1000 : 30000
        onDataChanged: {
            var date = new Date(data["Local"]["DateTime"]);
            hours = date.getHours();
            minutes = date.getMinutes();
            seconds = date.getSeconds();
        }
        Component.onCompleted: {
            onDataChanged();
        }
    }

    function dateTimeChanged()
    {
        //console.log("Date/time changed!");

        var currentTZOffset = dataSource.data["Local"]["Offset"] / 60;
        if (currentTZOffset !== tzOffset) {
            tzOffset = currentTZOffset;
            //console.log("TZ offset changed: " + tzOffset);
            Date.timeZoneUpdated(); // inform the QML JS engine about TZ change
        }
    }

    Component.onCompleted: {
        tzOffset = new Date().getTimezoneOffset();
        //console.log("Initial TZ offset: " + tzOffset);
        dataSource.onDataChanged.connect(dateTimeChanged);
    }

    Plasmoid.compactRepresentation: Item {
        id: representation
        Layout.minimumWidth: Plasmoid.formFactor !== PlasmaCore.Types.Vertical ? representation.height : PlasmaCore.Units.gridUnit
        Layout.minimumHeight: Plasmoid.formFactor === PlasmaCore.Types.Vertical ? representation.width : PlasmaCore.Units.gridUnit

        MouseArea {
            anchors.fill: parent
            onClicked: Plasmoid.expanded = !Plasmoid.expanded
        }

        PlasmaCore.Svg {
            id: clockSvg
            //FIXME: Svg doesn't support relative paths
            imagePath: Qt.resolvedUrl("clock.svgz").substring(7)
        }

        Item {
            id: clock
            width: parent.width
            anchors {
                top: parent.top
                bottom: parent.bottom
            }
            readonly property double svgScale: face.width / face.naturalSize.width

            PlasmaCore.SvgItem {
                id: face
                anchors.centerIn: parent
                width: Math.min(parent.width, parent.height)
                height: Math.min(parent.width, parent.height)
                svg: clockSvg
                elementId: "ClockFace"
            }

            PlasmaCore.SvgItem {
                id: num12
                anchors.centerIn: parent
                width: Math.min(parent.width, parent.height)
                height: Math.min(parent.width, parent.height)
                visible: show12
                svg: clockSvg
                elementId: "Num12"
            }

            PlasmaCore.SvgItem {
                id: num3
                anchors.centerIn: parent
                width: Math.min(parent.width, parent.height)
                height: Math.min(parent.width, parent.height)
                visible: show3
                svg: clockSvg
                elementId: "Num3"
            }

            PlasmaCore.SvgItem {
                id: num6
                anchors.centerIn: parent
                width: Math.min(parent.width, parent.height)
                height: Math.min(parent.width, parent.height)
                visible: show6
                svg: clockSvg
                elementId: "Num6"
            }

            PlasmaCore.SvgItem {
                id: num9
                anchors.centerIn: parent
                width: Math.min(parent.width, parent.height)
                height: Math.min(parent.width, parent.height)
                visible: show9
                svg: clockSvg
                elementId: "Num9"
            }

            Tick {
                elementId: "BigTick"
                position: 0
                visible: !show12 && showBigTicks
                svgScale: clock.svgScale
            }

            Tick {
                elementId: "SmallTick"
                position: 0
                visible: !show12 && !showBigTicks && showSmallTicks
                svgScale: clock.svgScale
            }

            Tick {
                elementId: "SmallTick"
                position: 1
                visible: showSmallTicks
                svgScale: clock.svgScale
            }
            Tick {
                elementId: "SmallTick"
                position: 2
                visible: showSmallTicks
                svgScale: clock.svgScale
            }

            Tick {
                elementId: "BigTick"
                position: 3
                visible: !show3 && showBigTicks
                svgScale: clock.svgScale
            }

            Tick {
                elementId: "SmallTick"
                position: 3
                visible: !show3 && !showBigTicks && showSmallTicks
                svgScale: clock.svgScale
            }

            Tick {
                elementId: "SmallTick"
                position: 4
                visible: showSmallTicks
                svgScale: clock.svgScale
            }

            Tick {
                elementId: "SmallTick"
                position: 5
                visible: showSmallTicks
                svgScale: clock.svgScale
            }

            Tick {
                elementId: "BigTick"
                position: 6
                visible: !show6 && showBigTicks
                svgScale: clock.svgScale
            }

            Tick {
                elementId: "SmallTick"
                position: 6
                visible: !show6 && !showBigTicks && showSmallTicks
                svgScale: clock.svgScale
            }

            Tick {
                elementId: "SmallTick"
                position: 7
                visible: showSmallTicks
                svgScale: clock.svgScale
            }

            Tick {
                elementId: "SmallTick"
                position: 8
                visible: showSmallTicks
                svgScale: clock.svgScale
            }

            Tick {
                elementId: "BigTick"
                position: 9
                visible: !show9 && showBigTicks
                svgScale: clock.svgScale
            }

            Tick {
                elementId: "SmallTick"
                position: 9
                visible: !show9 && !showBigTicks && showSmallTicks
                svgScale: clock.svgScale
            }

            Tick {
                elementId: "SmallTick"
                position: 10
                visible: showSmallTicks
                svgScale: clock.svgScale
            }

            Tick {
                elementId: "SmallTick"
                position: 11
                visible: showSmallTicks
                svgScale: clock.svgScale
            }

            Hand {
                elementId: "SecondHand"
                rotation: 180 + seconds * 6
                visible: showSecondHand
                svgScale: clock.svgScale
            }

            Hand {
                elementId: "MinuteHand"
                rotation: 180 + minutes * 6
                visible: showMinuteHand
                svgScale: clock.svgScale
            }

            Hand {
                elementId: "HourHand"
                rotation: 180 + hours * 30 + (minutes/2)
                visible: showHourHand
                svgScale: clock.svgScale
            }
        }
    }
}
