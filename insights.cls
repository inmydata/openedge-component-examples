 
 /*------------------------------------------------------------------------
    File        : insights
    Purpose     : Displays an Insights view for the provided tenant using the inmydata AnalyticsControl
    Syntax      : 
    Description : 
    Author(s)   : 
    Created     : Tue Jul 01 17:32:53 BST 2025
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS insights INHERITS Form: 
    
    DEFINE PRIVATE VARIABLE analyticsControl AS inmydata.WindowsForms.Library.AnalyticsControl NO-UNDO.
    DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer NO-UNDO.

    /* --- Constructor ---
       Initializes the form and assigns the tenant context
    */
    CONSTRUCTOR PUBLIC insights ( tenant AS CHARACTER ):
        
        InitializeComponent().
        analyticsControl:Tenant = tenant.
        analyticsControl:ContentType = inmydata.WindowsForms.Library.AnalyticsControl+ContentTypeEnum:Insights.
        THIS-OBJECT:ComponentsCollection:Add(THIS-OBJECT:components).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.

    END CONSTRUCTOR.

	/* --- Event: InsightOpened ---
       Triggered when the user opens an insight from the control.
       Launches a new window to show a specific visualisation for that insight.
    */
	@VisualDesigner.
	METHOD PRIVATE VOID analyticsControl_InsightOpened( INPUT sender AS System.Object, INPUT e AS inmydata.WindowsForms.Library.InsightsEventArgs ):
		DEFINE VARIABLE insightsViz AS InsightsViz.
		insightsViz = NEW InsightsViz(analyticsControl:Tenant, e:InsightChartID).
        insightsViz:Show().
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
        THIS-OBJECT:analyticsControl:ContentType = inmydata.WindowsForms.Library.AnalyticsControl+ContentTypeEnum:Full.
        THIS-OBJECT:analyticsControl:Dock = System.Windows.Forms.DockStyle:Fill.
        THIS-OBJECT:analyticsControl:ForeColor = System.Drawing.SystemColors:ControlText.
        THIS-OBJECT:analyticsControl:ForegroundColor = -2147483630.
        THIS-OBJECT:analyticsControl:ID = ?.
        THIS-OBJECT:analyticsControl:InsightChartID = ?.
        THIS-OBJECT:analyticsControl:Location = NEW System.Drawing.Point(0, 0).
        THIS-OBJECT:analyticsControl:Name = "analyticsControl".
        THIS-OBJECT:analyticsControl:Question = ?.
        THIS-OBJECT:analyticsControl:Server = "inmydata.com".
        THIS-OBJECT:analyticsControl:ShowToolbar = FALSE.
        THIS-OBJECT:analyticsControl:ShowTools = FALSE.
        THIS-OBJECT:analyticsControl:ShowToolToggle = FALSE.
        THIS-OBJECT:analyticsControl:Size = NEW System.Drawing.Size(421, 705).
        THIS-OBJECT:analyticsControl:Subject = ?.
        THIS-OBJECT:analyticsControl:SuppressDrilldown = FALSE.
        THIS-OBJECT:analyticsControl:TabIndex = 0.
        THIS-OBJECT:analyticsControl:Tenant = ?.
        THIS-OBJECT:analyticsControl:VisReadOnly = FALSE.
        THIS-OBJECT:analyticsControl:InsightOpened:Subscribe(THIS-OBJECT:analyticsControl_InsightOpened).
        /*  */
        /* insights */
        /*  */
        THIS-OBJECT:ClientSize = NEW System.Drawing.Size(421, 705).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:analyticsControl).
        THIS-OBJECT:Name = "insights".
        THIS-OBJECT:Text = "insights".
        THIS-OBJECT:Load:Subscribe(THIS-OBJECT:insights_Load).
        THIS-OBJECT:ResumeLayout(FALSE).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.
    END METHOD.

	/* --- Load Event ---
       Called when the form loads, triggers loading of the analytics data.
    */
	@VisualDesigner.
	METHOD PRIVATE VOID insights_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		analyticsControl:LoadView().
		RETURN.
	END METHOD.

    DESTRUCTOR PUBLIC insights ( ):

    END DESTRUCTOR.

END CLASS.