 
 /*------------------------------------------------------------------------
    File        : dashboard
    Purpose     : Displays a specific dashboard with configurable UI options
    Syntax      : 
    Description : 
    Author(s)   : 
    Created     : Tue Jul 01 20:01:22 BST 2025
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS dashboard INHERITS Form: 
    
    DEFINE PRIVATE VARIABLE analyticsControl AS inmydata.WindowsForms.Library.AnalyticsControl NO-UNDO.
    DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer NO-UNDO.
    DEFINE PRIVATE VARIABLE suppressDrillDownsToolStripMenuItem AS System.Windows.Forms.ToolStripMenuItem NO-UNDO.
    DEFINE PRIVATE VARIABLE showToolbarToolStripMenuItem AS System.Windows.Forms.ToolStripMenuItem NO-UNDO.
    DEFINE PRIVATE VARIABLE optionsToolStripMenuItem AS System.Windows.Forms.ToolStripMenuItem NO-UNDO.
    DEFINE PRIVATE VARIABLE menuStrip1 AS System.Windows.Forms.MenuStrip NO-UNDO.

    /* --- Constructor ---
       Initializes the dashboard with the given tenant and dashboard ID.
       Syncs control settings with menu checkbox states.
    */
    CONSTRUCTOR PUBLIC dashboard ( tenant AS CHARACTER, dashboardId  AS CHARACTER ):
        
        InitializeComponent().
        analyticsControl:ContentType = inmydata.WindowsForms.Library.AnalyticsControl+ContentTypeEnum:Dashboard.
        analyticsControl:Tenant = tenant.
        analyticsControl:ID = dashboardId.
        analyticsControl:ShowToolbar = showToolbarToolStripMenuItem:Checked.
        analyticsControl:SuppressDrilldown = suppressDrillDownsToolStripMenuItem:Checked.
        THIS-OBJECT:ComponentsCollection:Add(THIS-OBJECT:components).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.

    END CONSTRUCTOR.

	/* --- Drilldown Event Handler ---
       Displays a message box with clicked drilldown data if drilldowns are not suppressed.
    */
	@VisualDesigner.
	METHOD PRIVATE VOID analyticsControl_Drilldown( INPUT sender AS System.Object, INPUT e AS inmydata.WindowsForms.Library.DrillDownEventArgs ):
		IF suppressDrillDownsToolStripMenuItem:Checked THEN DO:
          IF e:DataValues = ? OR e:DataValues:Count = 0 THEN DO:
            MESSAGE "No drilldown data available." VIEW-AS ALERT-BOX.
            RETURN.
          END.
          DEFINE VARIABLE msg AS CHARACTER NO-UNDO INITIAL "".
          DEFINE VARIABLE ix AS INTEGER NO-UNDO.
          REPEAT ix = 1 TO e:DataValues:COUNT:
            DEFINE VARIABLE dataValue AS inmydata.WindowsForms.Library.DrillDownDataValues NO-UNDO.
            dataValue = CAST(e:DataValues:Item[ix], inmydata.WindowsForms.Library.DrillDownDataValues).
            IF msg <> "" THEN msg = msg + CHR(10).
            msg = msg + "Column " + dataValue:Name + " = " + dataValue:Value:ToString().
          END.
          MESSAGE msg VIEW-AS ALERT-BOX.
        END.
        RETURN.
	END METHOD.

	/* --- Load Event Handler ---
       Called when the form is loaded; triggers rendering the dashboard.
    */
	@VisualDesigner.
	METHOD PRIVATE VOID dashboard_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		analyticsControl:LoadView().
		RETURN.

	END METHOD.

    METHOD PRIVATE VOID InitializeComponent(  ):
        
        /* NOTE: The following method is automatically generated.
        
        We strongly suggest that the contents of this method only be modified using the
        Visual Designer to avoid any incompatible modifications.
        
        Modifying the contents of this method using a code editor will invalidate any support for this file. */
        THIS-OBJECT:analyticsControl = NEW inmydata.WindowsForms.Library.AnalyticsControl().
        THIS-OBJECT:menuStrip1 = NEW System.Windows.Forms.MenuStrip().
        THIS-OBJECT:optionsToolStripMenuItem = NEW System.Windows.Forms.ToolStripMenuItem().
        THIS-OBJECT:showToolbarToolStripMenuItem = NEW System.Windows.Forms.ToolStripMenuItem().
        THIS-OBJECT:suppressDrillDownsToolStripMenuItem = NEW System.Windows.Forms.ToolStripMenuItem().
        THIS-OBJECT:menuStrip1:SuspendLayout().
        THIS-OBJECT:SuspendLayout().
        /*  */
        /* analyticsControl */
        /*  */
        THIS-OBJECT:analyticsControl:AIChatChartID = ?.
        THIS-OBJECT:analyticsControl:BackColor = System.Drawing.SystemColors:Control.
        THIS-OBJECT:analyticsControl:BackgroundColor = -2147483633.
        THIS-OBJECT:analyticsControl:ContentType = inmydata.WindowsForms.Library.AnalyticsControl+ContentTypeEnum:Dashboard.
        THIS-OBJECT:analyticsControl:Dock = System.Windows.Forms.DockStyle:Fill.
        THIS-OBJECT:analyticsControl:ForeColor = System.Drawing.SystemColors:ControlText.
        THIS-OBJECT:analyticsControl:ForegroundColor = -2147483630.
        THIS-OBJECT:analyticsControl:ID = ?.
        THIS-OBJECT:analyticsControl:InsightChartID = ?.
        THIS-OBJECT:analyticsControl:Location = NEW System.Drawing.Point(0, 24).
        THIS-OBJECT:analyticsControl:Name = "analyticsControl".
        THIS-OBJECT:analyticsControl:Question = ?.
        THIS-OBJECT:analyticsControl:Server = "inmydata.com".
        THIS-OBJECT:analyticsControl:ShowToolbar = FALSE.
        THIS-OBJECT:analyticsControl:ShowTools = FALSE.
        THIS-OBJECT:analyticsControl:ShowToolToggle = FALSE.
        THIS-OBJECT:analyticsControl:Size = NEW System.Drawing.Size(1213, 870).
        THIS-OBJECT:analyticsControl:Subject = ?.
        THIS-OBJECT:analyticsControl:SuppressDrilldown = FALSE.
        THIS-OBJECT:analyticsControl:TabIndex = 0.
        THIS-OBJECT:analyticsControl:Tenant = ?.
        THIS-OBJECT:analyticsControl:VisReadOnly = FALSE.
        THIS-OBJECT:analyticsControl:Drilldown:Subscribe(THIS-OBJECT:analyticsControl_Drilldown).
        /*  */
        /* menuStrip1 */
        /*  */
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar0 AS System.Windows.Forms.ToolStripItem EXTENT 1 NO-UNDO.
        arrayvar0[1] = THIS-OBJECT:optionsToolStripMenuItem.
        THIS-OBJECT:menuStrip1:Items:AddRange(arrayvar0).
        THIS-OBJECT:menuStrip1:Location = NEW System.Drawing.Point(0, 0).
        THIS-OBJECT:menuStrip1:Name = "menuStrip1".
        THIS-OBJECT:menuStrip1:Size = NEW System.Drawing.Size(1213, 24).
        THIS-OBJECT:menuStrip1:TabIndex = 1.
        THIS-OBJECT:menuStrip1:Text = "menuStrip1".
        /*  */
        /* optionsToolStripMenuItem */
        /*  */
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar1 AS System.Windows.Forms.ToolStripItem EXTENT 2 NO-UNDO.
        arrayvar1[1] = THIS-OBJECT:showToolbarToolStripMenuItem.
        arrayvar1[2] = THIS-OBJECT:suppressDrillDownsToolStripMenuItem.
        THIS-OBJECT:optionsToolStripMenuItem:DropDownItems:AddRange(arrayvar1).
        THIS-OBJECT:optionsToolStripMenuItem:Name = "optionsToolStripMenuItem".
        THIS-OBJECT:optionsToolStripMenuItem:Size = NEW System.Drawing.Size(59, 20).
        THIS-OBJECT:optionsToolStripMenuItem:Text = "options".
        /*  */
        /* showToolbarToolStripMenuItem */
        /*  */
        THIS-OBJECT:showToolbarToolStripMenuItem:CheckOnClick = TRUE.
        THIS-OBJECT:showToolbarToolStripMenuItem:Name = "showToolbarToolStripMenuItem".
        THIS-OBJECT:showToolbarToolStripMenuItem:Size = NEW System.Drawing.Size(184, 22).
        THIS-OBJECT:showToolbarToolStripMenuItem:Text = "Show Toolbar".
        THIS-OBJECT:showToolbarToolStripMenuItem:CheckStateChanged:Subscribe(THIS-OBJECT:showToolbarToolStripMenuItem_CheckStateChanged).
        /*  */
        /* suppressDrillDownsToolStripMenuItem */
        /*  */
        THIS-OBJECT:suppressDrillDownsToolStripMenuItem:CheckOnClick = TRUE.
        THIS-OBJECT:suppressDrillDownsToolStripMenuItem:Name = "suppressDrillDownsToolStripMenuItem".
        THIS-OBJECT:suppressDrillDownsToolStripMenuItem:Size = NEW System.Drawing.Size(184, 22).
        THIS-OBJECT:suppressDrillDownsToolStripMenuItem:Text = "Suppress Drill Downs".
        THIS-OBJECT:suppressDrillDownsToolStripMenuItem:CheckStateChanged:Subscribe(THIS-OBJECT:suppressDrillDownsToolStripMenuItem_CheckStateChanged).
        /*  */
        /* dashboard */
        /*  */
        THIS-OBJECT:ClientSize = NEW System.Drawing.Size(1213, 894).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:analyticsControl).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:menuStrip1).
        THIS-OBJECT:MainMenuStrip = THIS-OBJECT:menuStrip1.
        THIS-OBJECT:Name = "dashboard".
        THIS-OBJECT:Text = "dashboard".
        THIS-OBJECT:Load:Subscribe(THIS-OBJECT:dashboard_Load).
        THIS-OBJECT:menuStrip1:ResumeLayout(FALSE).
        THIS-OBJECT:menuStrip1:PerformLayout().
        THIS-OBJECT:ResumeLayout(FALSE).
        THIS-OBJECT:PerformLayout().
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.
    END METHOD.

	/* --- Menu Option Handlers ---
       These update the dashboard display settings in response to menu checkbox changes.
    */
	@VisualDesigner.
	METHOD PRIVATE VOID showToolbarToolStripMenuItem_CheckStateChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		analyticsControl:ShowToolbar = showToolbarToolStripMenuItem:Checked.
        analyticsControl:RefreshView().
		RETURN.
	END METHOD.

	@VisualDesigner.
	METHOD PRIVATE VOID suppressDrillDownsToolStripMenuItem_CheckStateChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		analyticsControl:SuppressDrilldown = suppressDrillDownsToolStripMenuItem:Checked.
        analyticsControl:RefreshView().
		RETURN.
	END METHOD.

    DESTRUCTOR PUBLIC dashboard ( ):

    END DESTRUCTOR.

END CLASS.