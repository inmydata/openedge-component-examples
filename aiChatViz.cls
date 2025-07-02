 
 /*------------------------------------------------------------------------
    File        : aiChatViz
    Purpose     : Displays a single chart/visualisation suggested by copilot
    Syntax      : 
    Description : 
    Author(s)   : 
    Created     : Tue Jul 01 17:51:37 BST 2025
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS aiChatViz INHERITS Form: 
    
    DEFINE PRIVATE VARIABLE analyticsControl AS inmydata.WindowsForms.Library.AnalyticsControl NO-UNDO.
    DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer NO-UNDO.

    /* --- Constructor ---
       Accepts a tenant name and a chart ID, sets up the form to show the AI-generated visualisation.
    */
    CONSTRUCTOR PUBLIC aiChatViz ( tenant AS CHARACTER, chartID AS CHARACTER ):
        
        InitializeComponent().
        analyticsControl:ContentType = inmydata.WindowsForms.Library.AnalyticsControl+ContentTypeEnum:AIChatVisualisation.
        analyticsControl:Tenant = tenant.
        analyticsControl:AIChatChartID = chartID. 
        THIS-OBJECT:ComponentsCollection:Add(THIS-OBJECT:components).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.

    END CONSTRUCTOR.

	/* --- Load Event Handler ---
       Loads the visualisation when the form appears.
    */
	@VisualDesigner.
	METHOD PRIVATE VOID aiChatViz_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		analyticsControl:LoadView().
		RETURN.

	END METHOD.

    METHOD PRIVATE VOID InitializeComponent(  ):
        
        /* NOTE: The following method is automatically generated.
        
        We strongly suggest that the contents of this method only be modified using the
        Visual Designer to avoid any incompatible modifications.
        
        Modifying the contents of this method using a code editor will invalidate any support for this file. */
        THIS-OBJECT:analyticsControl = NEW inmydata.WindowsForms.Library.AnalyticsControl().
        THIS-OBJECT:SuspendLayout().
        /*  */
        /* analyticsControl */
        /*  */
        THIS-OBJECT:analyticsControl:AIChatChartID = ?.
        THIS-OBJECT:analyticsControl:BackColor = System.Drawing.SystemColors:Control.
        THIS-OBJECT:analyticsControl:BackgroundColor = -2147483633.
        THIS-OBJECT:analyticsControl:ContentType = inmydata.WindowsForms.Library.AnalyticsControl+ContentTypeEnum:AIChatVisualisation.
        THIS-OBJECT:analyticsControl:Dock = System.Windows.Forms.DockStyle:Fill.
        THIS-OBJECT:analyticsControl:ForeColor = System.Drawing.SystemColors:ControlText.
        THIS-OBJECT:analyticsControl:ForegroundColor = -2147483630.
        THIS-OBJECT:analyticsControl:ID = ?.
        THIS-OBJECT:analyticsControl:InsightChartID = ?.
        THIS-OBJECT:analyticsControl:Location = NEW System.Drawing.Point(0, 0).
        THIS-OBJECT:analyticsControl:Name = "analyticsControl".
        THIS-OBJECT:analyticsControl:Question = ?.
        THIS-OBJECT:analyticsControl:Server = "inmydata.com".
        THIS-OBJECT:analyticsControl:ShowToolbar = TRUE.
        THIS-OBJECT:analyticsControl:ShowTools = FALSE.
        THIS-OBJECT:analyticsControl:ShowToolToggle = TRUE.
        THIS-OBJECT:analyticsControl:Size = NEW System.Drawing.Size(978, 828).
        THIS-OBJECT:analyticsControl:Subject = ?.
        THIS-OBJECT:analyticsControl:SuppressDrilldown = FALSE.
        THIS-OBJECT:analyticsControl:TabIndex = 0.
        THIS-OBJECT:analyticsControl:Tenant = ?.
        THIS-OBJECT:analyticsControl:VisReadOnly = FALSE.
        /*  */
        /* aiChatViz */
        /*  */
        THIS-OBJECT:ClientSize = NEW System.Drawing.Size(978, 828).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:analyticsControl).
        THIS-OBJECT:Name = "aiChatViz".
        THIS-OBJECT:Text = "aiChatViz".
        THIS-OBJECT:Load:Subscribe(THIS-OBJECT:aiChatViz_Load).
        THIS-OBJECT:ResumeLayout(FALSE).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.
    END METHOD.

    DESTRUCTOR PUBLIC aiChatViz ( ):

    END DESTRUCTOR.

END CLASS.