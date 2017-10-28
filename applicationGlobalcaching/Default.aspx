<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="applicationGlobalcaching.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Globalcaching Application - The geocache manager</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="100%" 
            style="font-weight: bold; background-color: #0066FF; color: #FFFFFF; padding: 10px; cursor: pointer">
            <tr>
                <td onclick="location.href='#screenshots'">Screen shots</td>
                <td onclick="location.href='#download'">Download</td>
                <td onclick="location.href='#featurelist'">Feature list</td>
                <td onclick="location.href='http://wiki.globalcaching.eu/GAPP.ashx'">Dutch wiki</td>
                <td onclick="location.href='http://wiki.globalcaching.eu/GAPP-Deutschsprachige-Wiki.ashx'">German wiki</td>
                <td onclick="location.href='http://www.globalcaching.eu/forum/yaf_forum11_GAPP--Globalcaching-APPlication.aspx'">Forum</td>
                <td onclick="location.href='#documentation'">Documentation</td>
                <td onclick="location.href='#changehistory'">Change history</td>
                <td onclick="location.href='#gappgsak'">GAPP vs. GSAK</td>
            </tr>
        </table>
        <h1>Globalcaching Application</h1>
        <p>
        Globalcaching Application (short GAPP) is a <b>free</b> geocache manager application that enables you to browse and maintain geocaches on your local computer.
        </p>
        <p>
        GAPP is Geocaching Live enabled which makes it very easy to update your geocaches by downloading Pocket Queries or downloading geocaching by search criteria right from your application without the need to access geocaching.com.
        </p>
        <p>
        The application is intended for all user types, for the users who never used a geocache manager before to the experienced heavy data users.
        The application will be directly functional right after installation and can be configured to your needs.
        Programmers have access to the full source code to write plugins to add functionality or change existing functionality. More information can be found on the wiki pages.
        </p>

        <h2 id="download">Download</h2>
        <p>
        GAPP is available as a 32 bits (x86) application and a 64 bits (x64) application.<br />
        <span runat="server" id="x86">You are running a x86 system and should download the <a href="/pkg/x86/Setup.msi">x86 version</a>.</span>
        <span runat="server" id="x64">You are running a x64 system and should download the <a href="/pkg/x64/Setup.msi">x64 version</a></span><br />
        Current version is <asp:Label ID="x86Verersion" runat="server" Text=""></asp:Label>.<br />
        <br />
        Or download for another platform: <a href="/pkg/x86/Setup.msi">x86 (32 bits) version</a> <a href="/pkg/x64/Setup.msi">x64 (64 bits) version</a>
        </p>
        <table style="border-style: double; border-color: #FF0000"><tr><td>
        <b>Important!</b> You need to have .NET 4.0 full profile installed. If you get an error message with System.Web using the Geocache viewer or Google map, then
        you have probably only the Client profile installed.<br />
        Download and install Microsoft .NET 4 full (<a href="http://www.microsoft.com/download/details.aspx?id=17851" target="_blank">link</a>) and restart the GAPP.
        </td></tr></table>
        <h2 id="documentation">Documentation / Help</h2>
        <p>
            GAPP is a program developed by <a href="http://www.globalcaching.eu" target="_blank">Globalcaching.eu</a> and has an active community.
            <a href="http://www.globalcaching.eu" target="_blank">Globalcaching.eu</a> has a website with a forum. A special section is for GAPP.
            The direct link to this forum section: <a href="http://www.globalcaching.eu/forum/yaf_forum11_GAPP--Globalcaching-APPlication.aspx" target="_blank">GAPP forum</a><br />
            You can sign up and within your profile you can set the forum language to English or another language you like.
        </p>
        <p>
            There is also a special forum section for GAPP on the <strong>German geocaching forum</strong> site.
            The direct link to this forum section: <a href="http://forum.geoclub.de/viewforum.php?f=147" target="_blank">GAPP forum</a><br />
            You can sign up and within your profile you can set the forum language to English or another language you like.
        </p>
        <p>
            Programmers documentation can be found at <a href="/devdoc/index.html">Development documentation</a><br /><br />
            The documentation includes the source of the framework and all plugins.
        </p>

        <h2 id="featurelist">Main feature list (V1.5.1)</h2>
        <ul>
            <li>GPX / Pocket Query import</li>
            <li>GSAK database import</li>
            <li>GPX export</li>
            <li>OV2 export</li>
            <li>GDAK export</li>
            <li>Cachebox export</li>
            <li>Excel export</li>
            <li>Garmin POI export (by SKAMS)</li>
            <li>Export to Garmin mass storage GPS receiver</li>
            <li>Export to Garmin GPS receiver with Garmin Communicator Plugin</li>
            <li>Data backup and restore functionality (using GAPP Data Exchange file)</li>
            <li>Geocache search (by properties or text)</li>
            <li>Google map (for active geocache, selection or all geocaches)</li>
            <li>OSM map (online and <b>offline</b> for active geocache, selection or all geocaches)</li>
            <li>OpenLayers Map supporting Google Street Map, OSM, OCM, Bing Aerial and Bing Road maps</li>
            <li>Custom coordinates</li>
            <li>Geocache attachements, attach files to a geocache</li>
            <li>Geocache notes (with layout options)</li>
            <li>Geographical area support - text files</li>
            <li>Geographical area support - shapefiles</li>
            <li>Multilangual (English, Dutch, French, German)</li>
            <li>Package Manager (for updates and scripts installation)</li>
            <li>Geocache image grabber for offline image support</li>
            <li>Offline geocache viewer</li>
            <li>Geocaches along a route</li>
            <li>Statistics generation</li>
            <li>External GPS receiver support</li>
            <li>Graphical Query editor</li>
            <li>Graphical Action flow editor</li>
            <li>Integrated chat with option to follow other users</li>
            <li>Integrated web browser with scripting support to import and select geocaches from any website</li>
            <li>Live API: Get geocaches (by location or other properties)</li>
            <li>Live API: (Batch) Log geocaches</li>
            <li>Live API: Import notes</li>
            <li>Live API: Import bookmarks</li>
            <li>Live API: Import (other) users logs</li>
            <li>Live API: Import My Finds</li>
            <li>Live API: Import pocket queries</li>
            <li>Live API: Full update geocaches or refresh status only</li>
            <li>Live API: Trackable groups (create trackable groups, update the trackables and view them in a list or on the map)</li>
            <li>Live API: (Batch) log trackables</li>
            <li>Live API: Image gallery</li>
            <li>Geocache data storage options: SQLite, MySql and Sql Server</li>
            <li>Assign shurtcut keys to actions</li>
            <li>Backup/restore geocache coordinates due to missing coordinates in archived geocache import using the Live API</li>
            <li>Precompiled plugins (.NET)</li>
            <li>C# scripting</li>
        </ul>
        <p>
        Here is a movie about the main features (V1.4.7.0) and the integrated Web browser (V1.5.0.0)
        </p>
        <table>
            <tr>
                <td>
                    <iframe width="560" height="315" src="http://www.youtube.com/embed/ellkmNcbToc" frameborder="0" allowfullscreen="1"></iframe>
                </td>
                <td>
                    <iframe width="560" height="315" src="http://www.youtube.com/embed/1iWZKOdZaes" frameborder="0" allowfullscreen="1"></iframe>
                </td>
            </tr>
        </table>
        <p>
            Programmers:<br />
            The application contains:
        </p>
        <ul>
            <li>Framework (data definitions and interfaces)</li>
            <li>Plugins (containing the functionalities / features)</li>
            <li>Core (engine that loads the plugin and acts as a data container)</li>
        </ul>
        <p>
            The application is almost 100% plugins. Plugins and scripts (script runner is also a plugin) can make use of a useful feature rich Utils library.
            Source code of all the code with the exception of the core is available on the website with generated documentation.
        </p>

        <h2 id="changehistory">Change history</h2>

        <h3>2013-02-19 - V1.5.1</h3>
        <ul>
            <li>fix: If the geometry.db3 cannot be read, the application will continue to work now.</li>
            <li>fix: Changed Web browser plugin type to UIChildWindow plugin type</li>
            <li>add: Added Web browser icon to toolbar</li>
            <li>change: Web browser script has new constructor to pass the browser page</li>
            <li>add: Web browser script added to force a rework on the webpage like rescanning the web page for GC codes.</li>
            <li>add: Live API geocache import now also contains filter on publication date</li>
        </ul>

        <h3>2013-02-17 - V1.5.0</h3>
        <ul>
            <li>change: French language updated (thanks RHCV)</li>
            <li>add: Integrated web browser with scripting options. Standard scripts to import and select geocaches</li>
            <li>change: German language updated (thanks SKAMS)</li>
        </ul>


<a href="" onclick="javascript:if (document.getElementById('histlist').style.display=='inline'){document.getElementById('histlist').style.display='none'}else{document.getElementById('histlist').style.display='inline'}; return false;">Show complete list</a><br />
<div id="histlist" style="display:none">
<br />
        <h3>2013-02-12 - V1.4.19</h3>
        <ul>
            <li>fix: Cachebox export now uses custom coordinates if available</li>
            <li>change: Grabbing images for offline viewing optionally now only grabs currently local not present images</li>
            <li>change: German language updated (thanks SKAMS)</li>
            <li>add: option to GDAK export to put offline images in sub folders with maximum amount of files (settings)</li>
            <li>fix: Action builder next flow action</li>
            <li>add: Action builder option to copy an existing flow</li>
        </ul>

        <h3>2013-02-05 - V1.4.18</h3>
        <ul>
            <li>fix: Cachebox export now does not export Waypoints without a coordinate</li>
            <li>add: Bookmarks, live api import and geocache selection</li>
            <li>add: Import all or range on date geocache logs of other user(s)</li>
            <li>add: Geocache search dialog now also has Found by and Not found by filters</li>
            <li>add: Logs viewer (filters on geocache or user)</li>
        </ul>

        <h3>2013-02-01 - V1.4.17</h3>
        <ul>
            <li>fix: Live API import geocaches the exlusive filter reversed</li>
            <li>change: German language updated (thanks SKAMS)</li>
            <li>add: Export to Cachebox</li>
            <li>change: The import using live api dialog now contains a default setting selection</li>
            <li>change: The import using live api dialog made search on location and geocache codes mutual exclusive</li>
        </ul>

        <h3>2013-01-29 - V1.4.16</h3>
        <ul>
            <li>fix: OK button on offline log window will now close the window</li>
            <li>add: Action Builder now contains condition: Notes contains. To filter caches with notes that contain specific text.</li>
            <li>add: Action Builder now contains condition: # User Waypoints.</li>
            <li>add: framework contains user waypoints</li>
            <li>change: if version check after startup in the background fails, there will be no error message</li>
            <li>add: the cache list now also contains a field User waypoints that indicates if a user waypoint is present for this cache</li>
            <li>add: quick selection for caches with user waypoints</li>
            <li>add: added User Waypoints editor</li>
            <li>change: Geocache Viewer now also shows User waypoints</li>
        </ul>

        <h3>2013-01-23 - V1.4.15</h3>
        <ul>
            <li>fix: enabled OK button on offline log window</li>
        </ul>

        <h3>2013-01-23 - V1.4.14</h3>
        <ul>
            <li>change: German language updated (thanks SKAMS)</li>
            <li>add: added found date field in Excel export</li>
            <li>fix: adding/changing or deleting a waypoint now also updates the map for selected geocache</li>
            <li>change: maximum log text length set to 4000 characters</li>
            <li>change: French language updated (thanks RHCV)</li>
            <li>add: offline geocache logging</li>
        </ul>

        <h3>2013-01-17 - V1.4.13</h3>
        <ul>
            <li>change: French language updated (thanks RHCV)</li>
            <li>add: External GPS support (serial port, e.g. use Garmun GPS with USB and GpsGate)</li>
            <li>add: Google map shows current GPS position if available and button to center map on current position</li>
            <li>add: OSM Map (online and offline) shows current GPS position if available and button to center map on current position</li>
            <li>change: cluster setting of Google maps set less aggressive</li>
            <li>add: Create route for selected geocaches (or manually created points)</li>
        </ul>

        <h3>2013-01-14 - V1.4.12</h3>
        <ul>
            <li>fix: terrain and difficulty filter was truncated to an integer. Now it can handle 1.5, 2.5 etc.</li>
            <li>change: German language updated (thanks SKAMS)</li>
            <li>add: filter preset option added to Live API geocache import</li>
            <li>add: quick selection now has an option to select geocaches that contains more than 1 found log by you</li>
            <li>add: user setting to set the delay between trackables updates in trackable groep feature.</li>
        </ul>

        <h3>2013-01-09 - V1.4.11</h3>
        <ul>
            <li>change: Using new version of the EPPlus library</li>
            <li>change: cache list now also restores the sorting setting at startup</li>
            <li>fix: double click on scrollbar in cache list did open cache viewer, not anymore.</li>
            <li>change: Live API geocache import filter now has 0.5 increment value for terrain and difficulty</li>
            <li>fix: statistics generation, label of pie chart for founds per terrain has been fixed</li>
            <li>fix: Garmin GPX export now sends the file in UTF8 format (preserving special characters)</li>
            <li>add: Option to import the Garmin geocaching_visits.txt caches and log the geocaches.</li>
            <li>change: French language updated (thanks RHCV)</li>
            <li>fix: changed radius of geocaching import using LiveAPI from 100 to 50 according API limits</li>
        </ul>

        <h3>2012-12-27 - V1.4.10</h3>
        <ul>
            <li>change: German language updated (thanks SKAMS)</li>
            <li>fix: disabled MySql timeout on reading data</li>
            <li>fix: fix SQL Server, creating new database</li>
            <li>fix: fix SQL Server, adding logs to database (not all were saved)</li>
            <li>add: added background loading of logs option (settings screen).</li>
        </ul>

        <h3>2012-12-19 - V1.4.9</h3>
        <ul>
            <li>change: German language updated (thanks SKAMS)</li>
            <li>fix: GPX export cache type Unknown Cache fixed and id attributes for cache type removed</li>
            <li>add: Garmin export, added option to add or not to add child waypoints</li>
            <li>add: added Locked state to geocache (cache list, ceache editor). Locked geocaches are not updated by GPX update or Live API update. (only available or archived status are updated)</li>
        </ul>

        <h3>2012-12-02 - V1.4.8</h3>
        <ul>
            <li>fix: log geocache screen when adding trackables, the window has the correct size.</li>
            <li>add: GAPP data exchange export and import to facilitate internal storage change and data backup and restore</li>
            <li>change: French language updated (thanks RHCV)</li>
        </ul>

        <h3>2012-10-26 - V1.4.7</h3>
        <ul>
            <li>fix: Excel export with latitude and longitude of geocache coords</li>
            <li>change: exception handling on initial language selection</li>
        </ul>

        <h3>2012-10-25 - V1.4.5</h3>
        <ul>
            <li>fix: Excel export with corrected coords</li>
        </ul>

        <h3>2012-10-24 - V1.4.4</h3>
        <ul>
            <li>fix: Live API check on Premium Member now also checks Charter members</li>
            <li>fix: Google road map, removed OSM contribution</li>
            <li>add: added google road map to maps toolbar on main screen</li>
            <li>change: all maps have a seperate window position setting</li>
            <li>change: German language updated (thanks SKAMS)</li>
            <li>fix: maps windows</li>
        </ul>

        <h3>2012-10-19 - V1.4.1</h3>
        <ul>
            <li>add: added google maps without browser (like OSM map)</li>
            <li>fix: splitscreen is working again</li>
            <li>add: option for most windows to decouple or couple to main screen (system menu)</li>
        </ul>

        <h3>2012-10-17 - V1.4.0</h3>
        <ul>
            <li>add: MySQL as internal storage option</li>
            <li>fix: in log visit trackable of caches you found, manual trackable entry removed</li>
        </ul>

        <h3>2012-10-15 - V1.3.8</h3>
        <ul>
            <li>add: Action builder, added Geocache counter</li>
            <li>add: Action builder, added Geocache attributes</li>
            <li>fix: logs are added automatically after logging geocache and marked as found if applicable</li>
            <li>fix: in log visit trackable of caches you found, getting your own trackables.</li>
            <li>fix: logging geocaches, getting the trackables you have</li>
            <li>add: cache logging, adding pictures (with automatic scaling)</li>
        </ul>

        <h3>2012-10-12 - V1.3.7</h3>
        <ul>
            <li>change: Action builder different colors for connectors</li>
            <li>change: Action builder: geocache container and type now only have equal and not equal connectors</li>
            <li>fix: Action builder: escape while drawing a connection line now stops the action</li>
            <li>change: German language updated (thanks SKAMS)</li>
            <li>add: Automate adding visit logs to a trackable for your finds (missing only)</li>
        </ul>

        <h3>2012-10-11 - V1.3.6</h3>
        <ul>
            <li>change: French language updated (thanks RHCV)</li>
            <li>add: Added toolbars items to main window</li>
            <li>add: Action Builder</li>
            <li>change: German language updated (thanks SKAMS)</li>
            <li>fix: Refreshing the geocache data now also updates waypoints</li>
        </ul>

        <h3>2012-10-06 - V1.3.5</h3>
        <ul>
            <li>change: added images to dropdown menu on main window</li>
            <li>change: French language updated (thanks RHCV)</li>
            <li>add: Query Builder</li>
        </ul>

        <h3>2012-10-05 - V1.3.4</h3>
        <ul>
            <li>change: German language updated (thanks SKAMS)</li>
            <li>fix: OSM map will now start at a higher zoom level when a cache is selected</li>
            <li>add: Added toolbars to main window</li>
            <li>fix: added exception handling for downloading geocache images</li>
            <li>fix: Search geocaches, search within selection</li>
        </ul>

        <h3>2012-10-02 - V1.3.3</h3>
        <ul>
            <li>add: added EPPlus library to be used by plugins for Excel support</li>
            <li>fix: Solver, Word value is case insensitive now</li>
            <li>change: LiveAPI, geocache import can be canceled</li>
            <li>add: Export to Excel file</li>
            <li>fix: Import geocaches with LiveAPI now contains coordinates for waypoints</li>
            <li>change: Settings screen changed from tabs to treeview</li>
            <li>fix: Prevent Map from steeling focus while selecting geocache</li>
            <li>fix: Main window position at startup</li>
        </ul>

        <h3>2012-09-27 - V1.3.2</h3>
        <ul>
            <li>fix: Select geocaches within selected regions will now work for all languages</li>
            <li>change: Added municipality to the search filter of the cachelist</li>
            <li>add: Added municipality and city filter to Search for geocache</li>
        </ul>

        <h3>2012-09-26 - V1.3.1</h3>
        <ul>
            <li>add: Added support for Shapefiles</li>
            <li>add: Select geocaches within selected regions</li>
            <li>change: applying settings contains progress bar now</li>
            <li>add: Shapefiles can be downloaded from within GAPP (Settings/Shapefiles)</li>
            <li>add: Added municipality to the cache list</li>
            <li>add: Auto assign region to geocaches (Country, State, Municipality, City)</li>
        </ul>

        <h3>2012-09-21 - V1.3.0</h3>
        <ul>
            <li>change: GPX import now also is able to handle child waypoints within geocache GPX</li>
            <li>change: GPX import now also is able to read opencaching.de GPX files</li>
            <li>change: GPX import now also is able to read GCTour GPX files</li>
            <li>change: GPX import now also is able to read opencaching.com GPX files</li>
            <li>change: GPX import now also is able to read GSAK GPX files</li>
            <li>change: French language updated (thanks RHCV)</li>
            <li>change: German language updated (thanks SKAMS)</li>
            <li>add: opencaching.de attributes</li>
            <li>fix: opencaching logs does not display html code</li>
            <li>fix: Geocache viewer: opencaching geocache description will show the pictures now</li>
        </ul>

        <h3>2012-09-20 - V1.2.15</h3>
        <ul>
            <li>add: more information about activity on splah screen</li>
            <li>add: Chat is extended with copying a selection from another user</li>
            <li>add: (WYSIWYG) HTML Editor</li>
            <li>add: OpenLayers Map supporting Google Street Map, OSM, OCM, Bing Aerial and Bing Road maps</li>
            <li>fix: Search for text within description is working properly now</li>
        </ul>

        <h3>2012-09-17 - V1.2.14</h3>
        <ul>
            <li>fix: layout of Geocache Editor</li>
            <li>add: added Geocache editor to context menu (right click) of geocache list</li>
            <li>add: show activity on splash screen</li>
            <li>fix: OSM offline maps, improved map rendering (clear cache to use the new tiles)</li>
            <li>change: OSM offline maps, improved speed on changing zoom levels</li>
            <li>add: Waypoint editor (also added to context menu (right click) of geocache list)</li>
        </ul>

        <h3>2012-09-15 - V1.2.13</h3>
        <ul>
            <li>add: badgegen statistics (thanks SKAMS)</li>
            <li>fix: applying settings will now always reload offline OSM maps</li>
            <li>fix: black spots on the map</li>
            <li>fix: preventing screen distortion by screen refresh during move of a screen</li>
            <li>add: finished OSM offline mapping with labels and POIs</li>
        </ul>

        <h3>2012-09-13 - V1.2.12</h3>
        <ul>
            <li>change: German language updated (thanks SKAMS)</li>
            <li>fix: Garmin Export POI index error (thanks SKAMS)</li>
            <li>fix: in statistics generarion, DefaultExtension. The sorting has been changed</li>
            <li>change: statistics generation has changed to use a skin</li>
            <li>add: new statistics added (thanks SKAMS)</li>
            <li>add: OSM offline (not completed yet)</li>
        </ul>

        <h3>2012-09-05 - V1.2.11</h3>
        <ul>
            <li>fix: text within Geocache editor</li>
            <li>fix: save geocache in Geocache editor</li>
        </ul>

        <h3>2012-09-05 - V1.2.10</h3>
        <ul>
            <li>add: added Startup plugin for setting autostart plugin actions (Settings)</li>
            <li>add: the order of the colums with the simple cache list is now restored after re-start</li>
            <li>add: Solver, a series of tools to solve mysteries (a start has been made)</li>
            <li>add: Geocache editor to edit any field of the geocache</li>
            <li>change: French language updated (thanks RHCV)</li>
        </ul>

        <h3>2012-09-02 - V1.2.9</h3>
        <ul>
            <li>change: French language updated (thanks RHCV)</li>
            <li>fix: Filter on caches not found, now only checks Found flag of geocache and not the logs</li>
            <li>fix: Filter on caches found, now only checks Found flag of geocache and not the logs</li>
            <li>change: added select all and unselect all buttons in Live API import Pocket Queries</li>
            <li>add: added Found / Not found selection filter to the search for caches form</li>
        </ul>

        <h3>2012-09-01 - V1.2.8</h3>
        <ul>
            <li>add: statistics</li>
            <li>change: made statistics translatable and added Dutch</li>
            <li>fix: GPX export, symbol now set to Geocache Found if geocache has been found</li>
            <li>fix: GPX import. if sym ends with Found, the geocache will be marked as found</li>
            <li>add: added action to add events to outlook or google calendar</li>
            <li>change: on Google and Open street map, caches with corrected coords have another color and placed on corrected location</li>
            <li>fix: Export Garmin POI now also works for x64 version</li>
        </ul>

        <h3>2012-08-20 - V1.2.7</h3>
        <ul>
            <li>add: Garmin export with communicator, option to add notes to description</li>
            <li>add: new statistics</li>
            <li>add: new version notification (active check after starting the application)</li>
            <li>fix: deleting statistics script will now delete it permanently</li>
        </ul>

        <h3>2012-08-20 - V1.2.5</h3>
        <ul>
            <li>fix: The list of found geocaches will now result in a unique list of geocaches</li>
        </ul>

        <h3>2012-08-19 - V1.2.4</h3>
        <ul>
            <li>add: cache list contains container now</li>
            <li>add: filter in cachelist now also works on State</li>
            <li>add: Country and State filters in Geocache search plugin</li>
            <li>add: Availablity and Archived status added to the cache list</li>
            <li>add: A new plugin has been added Statistics generator. Still work in progress.</li>
        </ul>

        <h3>2012-08-09 - V1.2.3</h3>
        <ul>
            <li>add: OSM map now also has a view geocache selection filter (All, Selected, Active)</li>
            <li>change: saved windows position and size of OSM window</li>
            <li>change: double click on OSM map will zoom in and center on location</li>
            <li>fix: log ID in GPX imported converted to GL code to prevent double log entries. live API returns GL code</li>
        </ul>

        <h3>2012-08-05 - V1.2.2</h3>
        <ul>
            <li>change: German language updated (thanks SKAMS)</li>
            <li>add: Open Street Map (online)</li>
            <li>add: File Drag and Drop on main window to import GPX (gpx or gpx in zip files)</li>
            <li>add: commandline arguments options (gpx or zip fioe containing gpx files)</li>
            <li>change: only one instance of the application (second cannot be opened)</li>
            <li>fix: include hints when importing geocache through Live API</li>
            <li>fix: All date time fields stored in UTC time and converted back to local time on reading database</li>
        </ul>

        <h3>2012-07-28 - V1.2.1</h3>
        <ul>
            <li>add: Chat, message when user joined the rooom</li>
            <li>change: sounds in chat</li>
            <li>fix: filter bad charachters from GPX (export)</li>
            <li>fix: progressbar in export to garmin with communicator</li>
            <li>fix: dutch language in export with garmin communicator</li>
        </ul>

        <h3>2012-07-27 - V1.2.0</h3>
        <ul>
            <li>add: GPX export to Garmin using the Garmin Communicator Plugin</li>
            <li>fix: In the chat made unable to follow your self</li>
            <li>change: French language updates (thanks RHCV)</li>
        </ul>

        <h3>2012-07-25 - V1.1.12</h3>
        <ul>
            <li>add: Integrated chat with option to follow other users</li>
        </ul>

        <h3>2012-07-22 - V1.1.11</h3>
        <ul>
            <li>fix: performance fix for found date column in cache list</li>
        </ul>

        <h3>2012-07-21 - V1.1.10</h3>
        <ul>
            <li>fix: Main window status bar now indicates the file/database which is used on local storage change</li>
            <li>add: backup/restore geocache coordinates due to missing coordinates in archived geocache import using the Live API</li>
            <li>add: found date column in cache list</li>
            <li>fix: date format in the cache list now uses culture of user and therefore now displays correctly</li>
            <li>add: GDAK export now will also export the grabbed images (setting)</li>
            <li>add: setup now offers to start the application after finishing installation</li>
        </ul>

        <h3>2012-07-14 - V1.1.9</h3>
        <ul>
            <li>fix: GDAK export now uses a different Sqlite library</li>
            <li>fix: GDAK export convert log id to number if log id is not a number</li>
            <li>fix: GSAK import now uses a different Sqlite library</li>
            <li>add: Main window status bar now indicates the file/database which is used</li>
            <li>change: default internal storage has been changed to GlobalcachingApplication.Plugins.Sqlite.InternalStorage (slower, but should always work)</li>
            <li>fix: Include the Geocache ID when importing geocaches using the Live API</li>
        </ul>

        <h3>2012-07-11 - V1.1.8</h3>
        <ul>
            <li>fix: My Finds now also includes archived geocaches</li>
            <li>fix: Image Gallery now also includes archived geocaches</li>
        </ul>

        <h3>2012-07-11 - V1.1.7</h3>
        <ul>
            <li>add: alternative SQLite library for database storage</li>
        </ul>

        <h3>2012-07-09 - V1.1.6</h3>
        <ul>
            <li>fix: My Finds now ignores archived logs</li>
            <li>fix: Image Gallery now ignores archived logs</li>
            <li>fix: Search actions (like quick select) items now moved to search menu</li>
            <li>fix: Selection of geocaches with attachements</li>
            <li>change: French language updated (thanks RHCV)</li>
        </ul>

        <h3>2012-07-08 - V1.1.5</h3>
        <ul>
            <li>add: Export Garmin POI (created by SKAMS)</li>
            <li>add: Image gallery, search and browse your log images offline</li>
        </ul>

        <h3>2012-07-04 - V1.1.4</h3>
        <ul>
            <li>add: batch logging for geocaches</li>
            <li>fix: seperator in scripts menu</li>
            <li>change: background color of trackable menu item of trackable group window</li>
            <li>add: geocache attachements. Files can be attached to geocaches.</li>
        </ul>

        <h3>2012-06-30 - V1.1.3</h3>
        <ul>
            <li>change: scripts will have a seperate menu</li>
            <li>change: a confirmation is shown after installing a script</li>
            <li>add: Live API, retrieve My Finds by getting your logs and corresponding geocaches</li>
            <li>fix: IsGeocacheFound (in Utils.DataAccess) now also looks at Found flag of geocache if username equals the geocaching.com account name</li>
            <li>change: updated French language (thanks RHCV)</li>
            <li>add: quick search; caches not found by you</li>
        </ul>

        <h3>2012-06-23 - V1.1.2</h3>
        <ul>
            <li>fix: test api token now retrieved from settings at startup</li>
            <li>change: updated French language (thanks RHCV)</li>
            <li>add: (batch) logging for trackables</li>
            <li>add: trackable logging when logging a geocache</li>
            <li>add: changes in scripting folder is detected automatically</li>
        </ul>

        <h3>2012-06-15 - V1.1.1</h3>
        <ul>
            <li>fix: Refresh geocache data thru LiveAPI will also import the field notes.</li>
            <li>change: Import Pocket Query from LiveAPI; all PQs that are not updated yet are checked automatically for download.</li>
            <li>change: geocache viewer; link to geocache page will open de page in the default browser</li>
            <li>change: German language updated (thanks SKAMS)</li>
            <li>fix: Link to trackable page (from Trackable Groups) on the map corrected.</li>
            <li>add: export to GDAK (new) database (thanks wolojoli)</li>
            <li>add: show waypoints of geocache on map when available</li>
            <li>fix: Import GSAK database; also import corrected coordinates (thanks wolojoli)</li>
        </ul>
        <h3>2012-06-11 - V1.1.0</h3>
        <ul>
            <li>First public beta</li>
        </ul>
</div>

        <h2 id="gappgsak">GAPP vs. GSAK</h2>
        <table style="border-style: solid; text-align: center">
            <tr style="border-style: ridge; background-color: #66CCFF;">
                <td>&nbsp;</td>
                <td>GAPP</td>
                <td>GSAK</td>
            </tr>
            <tr>
                <td>Multiple databases</td>
                <td>yes</td>
                <td>yes</td>
            </tr>
            <tr>
                <td>Live API</td>
                <td>yes</td>
                <td>yes</td>
            </tr>
            <tr>
                <td>Price</td>
                <td>Free</td>
                <td>$25</td>
            </tr>
            <tr>
                <td>Scripting</td>
                <td>C#</td>
                <td>(Own) Macro language</td>
            </tr>
            <tr>
                <td>Sqlite</td>
                <td>yes</td>
                <td>yes</td>
            </tr>
            <tr>
                <td>SQL Server (Express)</td>
                <td>yes</td>
                <td>No</td>
            </tr>
            <tr>
                <td>MySql</td>
                <td>yes</td>
                <td>No</td>
            </tr>
            <tr>
                <td>Multilingual</td>
                <td>yes</td>
                <td>yes</td>
            </tr>
            <tr>
                <td>Integrated chat/follow user</td>
                <td>yes</td>
                <td>no</td>
            </tr>
            <tr>
                <td>Google map</td>
                <td>yes</td>
                <td>yes</td>
            </tr>
            <tr>
                <td>Open street map (OSM) - online</td>
                <td>yes</td>
                <td>yes</td>
            </tr>
            <tr>
                <td>Open street map (OSM) - offline</td>
                <td>yes</td>
                <td>no</td>
            </tr>
            <tr>
                <td>Shapefile support</td>
                <td>yes</td>
                <td>no</td>
            </tr>
            <tr>
                <td>Graphical query editor</td>
                <td>yes</td>
                <td>no</td>
            </tr>
            <tr>
                <td>Graphical action flow editor</td>
                <td>yes</td>
                <td>no</td>
            </tr>
            <tr>
                <td>External GPS receiver support</td>
                <td>yes</td>
                <td>no</td>
            </tr>
            <tr>
                <td>Integrated web browser with scripting</td>
                <td>yes</td>
                <td>no</td>
            </tr>
        </table>
        <p>
        GSAK has been arround for a long time and has therefore more macro&quot;s written by users.
        GAPP however is more flexible in a way that it is more than just a geocache manager. Due to the design of the application and the plugin capabilities, everything is possible.
        E.g. trackable groups is a feature that allows you to manage any trackable and show them on a map.
        With the option of C# scripting, creating your own script is easier than ever before.
        </p>

        <h2 id="screenshots">Screenshots</h2>
        <img src="\images\gapp_splitscreen.png" /><br />
        Splitscreen<br />
        <br />
        <img src="\images\gapp_select.png" /><br />
        One of the many selection methods<br />
        <br />
        <img src="\images\gapp_googlemap.png" /><br />
        Google maps<br />
        <br />
        <img src="\images\gappactbuilder3.png" /><br />
        Graphical action flow editor<br />
        <br />
        <img src="\images\gappqrybuilder.png" /><br />
        Graphical query editor<br />
        <br />
        <img src="\images\gapp_settings.png" /><br />
        Settings<br />
        <br />
        <img src="\images\gapp91.png" /><br />
        Image gallery<br />
        <br />
        <img src="\images\gappchat.png" /><br />
        Chat, with option to follow users and import when geocache is not available in your database<br />
        <br />

        <h2 id="internal_storage">Changing data storage</h2>
        <p>
        The data storage is a plugin and this makes it possible to change the data storage. The default data storage is a SQLite database.<br />
        There are two SQLite data storage implementation. The default should be faster, but on some systems this is not working. The data will then never be saved.
        If this happens, you sould switch to the other implementation. See the picture below.
        </p>
        <p>
        In the menu go to Plugins-&gt;Settings.<br />
        Select GlobalcachingApplication.Plugins.Sqlite.InternalStorage and press Apply.<br />
        The application will be restarted.
        </p>
        <img src="\images\gappsqlite.png" /><br />
        Changing default data storage to the alternative SQLite library<br />
        <br />
    </div>
    </form>
</body>
</html>
