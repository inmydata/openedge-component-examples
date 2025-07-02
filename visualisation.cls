 
 /*------------------------------------------------------------------------
    File        : Visualisation
    Purpose     : Displays a custom visualisation with configurable options via menu.
    Syntax      : 
    Description : 
    Author(s)   : 
    Created     : Tue Jul 01 18:17:17 BST 2025
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS visualisation INHERITS Form: 
    
    DEFINE PRIVATE VARIABLE analyticsControl AS inmydata.WindowsForms.Library.AnalyticsControl NO-UNDO.
    DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer NO-UNDO.
    DEFINE PRIVATE VARIABLE suppressDrillDownsToolStripMenuItem AS System.Windows.Forms.ToolStripMenuItem NO-UNDO.
    DEFINE PRIVATE VARIABLE showToolsToolStripMenuItem AS System.Windows.Forms.ToolStripMenuItem NO-UNDO.
    DEFINE PRIVATE VARIABLE showToolsToggleToolStripMenuItem AS System.Windows.Forms.ToolStripMenuItem NO-UNDO.
    DEFINE PRIVATE VARIABLE showToolbarsToolStripMenuItem AS System.Windows.Forms.ToolStripMenuItem NO-UNDO.
    DEFINE PRIVATE VARIABLE readOnlyToolStripMenuItem AS System.Windows.Forms.ToolStripMenuItem NO-UNDO.
    DEFINE PRIVATE VARIABLE optionsToolStripMenuItem AS System.Windows.Forms.ToolStripMenuItem NO-UNDO.
    DEFINE PRIVATE VARIABLE menuStrip1 AS System.Windows.Forms.MenuStrip NO-UNDO.


    /* --- Constructor ---
       Accepts tenant and visualisation ID; configures form state from menu selections
    */
    CONSTRUCTOR PUBLIC visualisation ( tenant AS CHARACTER, visId  AS CHARACTER):
        
        InitializeComponent().
        analyticsControl:Tenant = tenant.
        analyticsControl:ContentType = inmydata.WindowsForms.Library.AnalyticsControl+ContentTypeEnum:Visualisation.
        analyticsControl:ID = visId.
        analyticsControl:ShowToolbar = showToolbarsToolStripMenuItem:Checked.
        analyticsControl:ShowTools = showToolsToolStripMenuItem:Checked.
        analyticsControl:ShowToolToggle = showToolsToggleToolStripMenuItem:Checked.
        analyticsControl:VisReadOnly = readOnlyToolStripMenuItem:Checked.
        analyticsControl:SuppressDrilldown = suppressDrillDownsToolStripMenuItem:Checked.
        THIS-OBJECT:ComponentsCollection:Add(THIS-OBJECT:components).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.

    END CONSTRUCTOR.

	/* --- Drilldown Event Handler ---
       Shows a popup message if supress drilldown is enabled and returns info from the clicked chart.
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

    METHOD PRIVATE VOID InitializeComponent(  ):
        
        /* NOTE: The following method is automatically generated.
        
        We strongly suggest that the contents of this method only be modified using the
        Visual Designer to avoid any incompatible modifications.
        
        Modifying the contents of this method using a code editor will invalidate any support for this file. */
        THIS-OBJECT:analyticsControl = NEW inmydata.WindowsForms.Library.AnalyticsControl().
        THIS-OBJECT:menuStrip1 = NEW System.Windows.Forms.MenuStrip().
        THIS-OBJECT:optionsToolStripMenuItem = NEW System.Windows.Forms.ToolStripMenuItem().
        THIS-OBJECT:showToolbarsToolStripMenuItem = NEW System.Windows.Forms.ToolStripMenuItem().
        THIS-OBJECT:showToolsToolStripMenuItem = NEW System.Windows.Forms.ToolStripMenuItem().
        THIS-OBJECT:showToolsToggleToolStripMenuItem = NEW System.Windows.Forms.ToolStripMenuItem().
        THIS-OBJECT:readOnlyToolStripMenuItem = NEW System.Windows.Forms.ToolStripMenuItem().
        THIS-OBJECT:suppressDrillDownsToolStripMenuItem = NEW System.Windows.Forms.ToolStripMenuItem().
        THIS-OBJECT:menuStrip1:SuspendLayout().
        THIS-OBJECT:SuspendLayout().
        /*  */
        /* analyticsControl */
        /*  */
        THIS-OBJECT:analyticsControl:AIChatChartID = ?.
        THIS-OBJECT:analyticsControl:BackColor = System.Drawing.SystemColors:Control.
        THIS-OBJECT:analyticsControl:BackgroundColor = -2147483633.
        THIS-OBJECT:analyticsControl:ContentType = inmydata.WindowsForms.Library.AnalyticsControl+ContentTypeEnum:Visualisation.
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
        THIS-OBJECT:analyticsControl:Size = NEW System.Drawing.Size(1148, 834).
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
        THIS-OBJECT:menuStrip1:Size = NEW System.Drawing.Size(1148, 24).
        THIS-OBJECT:menuStrip1:TabIndex = 1.
        THIS-OBJECT:menuStrip1:Text = "menuStrip1".
        /*  */
        /* optionsToolStripMenuItem */
        /*  */
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar1 AS System.Windows.Forms.ToolStripItem EXTENT 5 NO-UNDO.
        arrayvar1[1] = THIS-OBJECT:showToolbarsToolStripMenuItem.
        arrayvar1[2] = THIS-OBJECT:showToolsToolStripMenuItem.
        arrayvar1[3] = THIS-OBJECT:showToolsToggleToolStripMenuItem.
        arrayvar1[4] = THIS-OBJECT:readOnlyToolStripMenuItem.
        arrayvar1[5] = THIS-OBJECT:suppressDrillDownsToolStripMenuItem.
        THIS-OBJECT:optionsToolStripMenuItem:DropDownItems:AddRange(arrayvar1).
        THIS-OBJECT:optionsToolStripMenuItem:Name = "optionsToolStripMenuItem".
        THIS-OBJECT:optionsToolStripMenuItem:Size = NEW System.Drawing.Size(59, 20).
        THIS-OBJECT:optionsToolStripMenuItem:Text = "options".
        /*  */
        /* showToolbarsToolStripMenuItem */
        /*  */
        THIS-OBJECT:showToolbarsToolStripMenuItem:CheckOnClick = TRUE.
        THIS-OBJECT:showToolbarsToolStripMenuItem:Name = "showToolbarsToolStripMenuItem".
        THIS-OBJECT:showToolbarsToolStripMenuItem:Size = NEW System.Drawing.Size(184, 22).
        THIS-OBJECT:showToolbarsToolStripMenuItem:Text = "Show Toolbars".
        THIS-OBJECT:showToolbarsToolStripMenuItem:CheckStateChanged:Subscribe(THIS-OBJECT:showToolbarsToolStripMenuItem_CheckStateChanged).
        /*  */
        /* showToolsToolStripMenuItem */
        /*  */
        THIS-OBJECT:showToolsToolStripMenuItem:CheckOnClick = TRUE.
        THIS-OBJECT:showToolsToolStripMenuItem:Name = "showToolsToolStripMenuItem".
        THIS-OBJECT:showToolsToolStripMenuItem:Size = NEW System.Drawing.Size(184, 22).
        THIS-OBJECT:showToolsToolStripMenuItem:Text = "Show Tools".
        THIS-OBJECT:showToolsToolStripMenuItem:CheckStateChanged:Subscribe(THIS-OBJECT:showToolsToolStripMenuItem_CheckStateChanged).
        /*  */
        /* showToolsToggleToolStripMenuItem */
        /*  */
        THIS-OBJECT:showToolsToggleToolStripMenuItem:CheckOnClick = TRUE.
        THIS-OBJECT:showToolsToggleToolStripMenuItem:Name = "showToolsToggleToolStripMenuItem".
        THIS-OBJECT:showToolsToggleToolStripMenuItem:Size = NEW System.Drawing.Size(184, 22).
        THIS-OBJECT:showToolsToggleToolStripMenuItem:Text = "Show Tools Toggle".
        THIS-OBJECT:showToolsToggleToolStripMenuItem:CheckStateChanged:Subscribe(THIS-OBJECT:showToolsToggleToolStripMenuItem_CheckStateChanged).
        /*  */
        /* readOnlyToolStripMenuItem */
        /*  */
        THIS-OBJECT:readOnlyToolStripMenuItem:CheckOnClick = TRUE.
        THIS-OBJECT:readOnlyToolStripMenuItem:Name = "readOnlyToolStripMenuItem".
        THIS-OBJECT:readOnlyToolStripMenuItem:Size = NEW System.Drawing.Size(184, 22).
        THIS-OBJECT:readOnlyToolStripMenuItem:Text = "Read Only".
        THIS-OBJECT:readOnlyToolStripMenuItem:CheckStateChanged:Subscribe(THIS-OBJECT:readOnlyToolStripMenuItem_CheckStateChanged).
        /*  */
        /* suppressDrillDownsToolStripMenuItem */
        /*  */
        THIS-OBJECT:suppressDrillDownsToolStripMenuItem:CheckOnClick = TRUE.
        THIS-OBJECT:suppressDrillDownsToolStripMenuItem:Name = "suppressDrillDownsToolStripMenuItem".
        THIS-OBJECT:suppressDrillDownsToolStripMenuItem:Size = NEW System.Drawing.Size(184, 22).
        THIS-OBJECT:suppressDrillDownsToolStripMenuItem:Text = "Suppress Drill Downs".
        THIS-OBJECT:suppressDrillDownsToolStripMenuItem:CheckStateChanged:Subscribe(THIS-OBJECT:suppressDrillDownsToolStripMenuItem_CheckStateChanged).
        /*  */
        /* visualisation */
        /*  */
        THIS-OBJECT:ClientSize = NEW System.Drawing.Size(1148, 858).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:analyticsControl).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:menuStrip1).
        THIS-OBJECT:MainMenuStrip = THIS-OBJECT:menuStrip1.
        THIS-OBJECT:Name = "Visualisation".
        THIS-OBJECT:Text = "Visualisation".
        THIS-OBJECT:Load:Subscribe(THIS-OBJECT:visualisation_Load).
        THIS-OBJECT:menuStrip1:ResumeLayout(FALSE).
        THIS-OBJECT:menuStrip1:PerformLayout().
        THIS-OBJECT:ResumeLayout(FALSE).
        THIS-OBJECT:PerformLayout().
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.
    END METHOD.

	/* --- Menu Check Event Handlers ---
       Update the analytics control in real-time when the user toggles menu options.
    */
	@VisualDesigner.
	METHOD PRIVATE VOID readOnlyToolStripMenuItem_CheckStateChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		analyticsControl:VisReadOnly = readOnlyToolStripMenuItem:Checked.
        analyticsControl:RefreshView().
		RETURN.

	END METHOD.

	@VisualDesigner.
	METHOD PRIVATE VOID showToolbarsToolStripMenuItem_CheckStateChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		analyticsControl:ShowToolbar = showToolbarsToolStripMenuItem:Checked.
        analyticsControl:RefreshView().
		RETURN.

	END METHOD.

	@VisualDesigner.
	METHOD PRIVATE VOID showToolsToggleToolStripMenuItem_CheckStateChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		analyticsControl:ShowToolToggle = showToolsToggleToolStripMenuItem:Checked.
        analyticsControl:RefreshView().
		RETURN.

	END METHOD.

	@VisualDesigner.
	METHOD PRIVATE VOID showToolsToolStripMenuItem_CheckStateChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		analyticsControl:ShowTools = showToolsToolStripMenuItem:Checked.
        analyticsControl:RefreshView().
		RETURN.

	END METHOD.

	@VisualDesigner.
	METHOD PRIVATE VOID suppressDrillDownsToolStripMenuItem_CheckStateChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		analyticsControl:SuppressDrilldown = suppressDrillDownsToolStripMenuItem:Checked.
        analyticsControl:RefreshView().
		RETURN.

	END METHOD.

	/* --- Form Load Handler ---
       Called when the form is loaded. Triggers initial view rendering.
    */
    @VisualDesigner.
	METHOD PRIVATE VOID visualisation_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		analyticsControl:LoadView().
		RETURN.

	END METHOD.

    DESTRUCTOR PUBLIC visualisation ( ):

    END DESTRUCTOR.

END CLASS.