// Version: 3

import QtQuick 2.0
import org.kde.plasma.core 2.0 as PlasmaCore

Item {
	id: appletIcon
	property string source: ''
	property bool active: false
	readonly property bool usingPackageSvg: filename // plasmoid.file() returns "" if file doesn't exist.
	readonly property string filename: source ? plasmoid.file("", "icons/" + source + '.svg') : ""
	readonly property int minSize: Math.min(width, height)
	property bool smooth: true

	PlasmaCore.IconItem {
		anchors.fill: parent
		visible: !appletIcon.usingPackageSvg
		source: appletIcon.usingPackageSvg ? '' : appletIcon.source
		active: appletIcon.active
		smooth: appletIcon.smooth
	}

	PlasmaCore.SvgItem {
		id: svgItem
		anchors.centerIn: parent
		readonly property real minSize: Math.min(naturalSize.width, naturalSize.height)
		readonly property real widthRatio: naturalSize.width / svgItem.minSize
		readonly property real heightRatio: naturalSize.height / svgItem.minSize
        //if not using largest scale, keep pixel perfect
        width: naturalSize.width < 64 ? naturalSize.width : appletIcon.minSize * widthRatio
        height: naturalSize.height < 64 ? naturalSize.height : appletIcon.minSize * heightRatio

		smooth: appletIcon.smooth

		visible: appletIcon.usingPackageSvg
		svg: PlasmaCore.Svg {
			id: svg
			imagePath: appletIcon.filename
		}
	}
}
