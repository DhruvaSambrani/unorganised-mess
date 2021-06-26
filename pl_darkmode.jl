using DarkMode
	i = 49
	darkcss = HTML(
		DarkMode.CSSDarkMode(DarkMode.themes[i]).content *
		DarkMode.enable(theme=DarkMode.themes[i]).content *
		"<div></div>"*
		"<style>
		.CodeMirror-code{
			border-left: aliceblue solid 1px;
		}
		pre.CodeMirror-line{
			padding-left: 8px !important;
		}
		.CodeMirror-placeholder{
			color: rgba(255,255,255,0.5)!important;
			padding-left: 8px !important;
		}
		pluto-trafficlight {
			background: rgba(28, 81, 183, 0.6);
			border-left-color: rgba(28, 81, 183, 1);
		}
		pre.CodeMirror-line .CodeMirror-matchingbracket{
			text-decoration: unset !important;
			color: #ff613d !important;
			font-weight: 1000;
		}
		</style>"*
		DarkMode.WidthOverDocs(true).content
	)
