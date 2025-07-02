 
 /*------------------------------------------------------------------------
    File        : main.cls
    Purpose     : Demo form for interacting with inmydata components.
    Syntax      : 
    Description : 
    Author(s)   : 
    Created     : 
    Notes       : Uses Windows Forms inside an OpenEdge ABL application
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS main INHERITS Form: 
	
    DEFINE PRIVATE VARIABLE btnVis AS System.Windows.Forms.Button NO-UNDO.
    DEFINE PRIVATE VARIABLE btnShowInsights AS System.Windows.Forms.Button NO-UNDO.
    DEFINE PRIVATE VARIABLE btnShowDashboard AS System.Windows.Forms.Button NO-UNDO.
    DEFINE PRIVATE VARIABLE btnShowCopilot AS System.Windows.Forms.Button NO-UNDO.
    DEFINE PRIVATE VARIABLE btnFull AS System.Windows.Forms.Button NO-UNDO.
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer NO-UNDO.
    DEFINE PRIVATE VARIABLE txtVisID AS System.Windows.Forms.TextBox NO-UNDO.
    DEFINE PRIVATE VARIABLE txtTenant AS System.Windows.Forms.TextBox NO-UNDO.
    DEFINE PRIVATE VARIABLE txtDashboardID AS System.Windows.Forms.TextBox NO-UNDO.
    DEFINE PRIVATE VARIABLE llVisID AS System.Windows.Forms.LinkLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE llDashboardID AS System.Windows.Forms.LinkLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE lblVisID AS System.Windows.Forms.Label NO-UNDO.
    DEFINE PRIVATE VARIABLE lblDashboardID AS System.Windows.Forms.Label NO-UNDO.
    DEFINE PRIVATE VARIABLE grpViz AS System.Windows.Forms.GroupBox NO-UNDO.
    DEFINE PRIVATE VARIABLE grpTenant AS System.Windows.Forms.GroupBox NO-UNDO.
    DEFINE PRIVATE VARIABLE grpDashboard AS System.Windows.Forms.GroupBox NO-UNDO.
		
	CONSTRUCTOR PUBLIC main (  ):

        InitializeComponent().
        THIS-OBJECT:ComponentsCollection:Add(THIS-OBJECT:components).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.

	END CONSTRUCTOR.

	/* --- Button Click Handlers --- */
	@VisualDesigner.
	METHOD PRIVATE VOID btnFull_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		DEFINE VARIABLE full AS full.
		full = NEW full(txtTenant:Text).
		full:Show().
		RETURN.

	END METHOD.

	@VisualDesigner.
	METHOD PRIVATE VOID btnShowCopilot_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		DEFINE VARIABLE aiChat AS aiChat.
        aiChat = NEW aiChat(txtTenant:Text).
        aiChat:Show().
		RETURN.

	END METHOD.

	@VisualDesigner.
	METHOD PRIVATE VOID btnShowDashboard_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		DEFINE VARIABLE dashboard AS dashboard NO-UNDO.
        dashboard = NEW dashboard(txtTenant:Text, txtDashboardID:Text).
        dashboard:Show().
		RETURN.

	END METHOD.

	@VisualDesigner.
	METHOD PRIVATE VOID btnShowInsights_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		DEFINE VARIABLE insights AS insights.
        insights = NEW insights(txtTenant:Text).
        insights:Show().
		RETURN.

	END METHOD.

	@VisualDesigner.
	METHOD PRIVATE VOID btnVis_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		DEFINE VARIABLE visualisation AS visualisation NO-UNDO.
		visualisation = NEW visualisation(txtTenant:Text, txtVisID:Text).
		visualisation:Show().
		RETURN.

	END METHOD.

	METHOD PRIVATE VOID InitializeComponent(  ):
		
        /* NOTE: The following method is automatically generated.
        
        We strongly suggest that the contents of this method only be modified using the
        Visual Designer to avoid any incompatible modifications.
        
        Modifying the contents of this method using a code editor will invalidate any support for this file. */
        THIS-OBJECT:grpTenant = NEW System.Windows.Forms.GroupBox().
        THIS-OBJECT:grpDashboard = NEW System.Windows.Forms.GroupBox().
        THIS-OBJECT:llDashboardID = NEW System.Windows.Forms.LinkLabel().
        THIS-OBJECT:btnShowDashboard = NEW System.Windows.Forms.Button().
        THIS-OBJECT:txtDashboardID = NEW System.Windows.Forms.TextBox().
        THIS-OBJECT:lblDashboardID = NEW System.Windows.Forms.Label().
        THIS-OBJECT:grpViz = NEW System.Windows.Forms.GroupBox().
        THIS-OBJECT:llVisID = NEW System.Windows.Forms.LinkLabel().
        THIS-OBJECT:btnVis = NEW System.Windows.Forms.Button().
        THIS-OBJECT:txtVisID = NEW System.Windows.Forms.TextBox().
        THIS-OBJECT:lblVisID = NEW System.Windows.Forms.Label().
        THIS-OBJECT:btnShowInsights = NEW System.Windows.Forms.Button().
        THIS-OBJECT:btnShowCopilot = NEW System.Windows.Forms.Button().
        THIS-OBJECT:btnFull = NEW System.Windows.Forms.Button().
        THIS-OBJECT:txtTenant = NEW System.Windows.Forms.TextBox().
        THIS-OBJECT:grpTenant:SuspendLayout().
        THIS-OBJECT:grpDashboard:SuspendLayout().
        THIS-OBJECT:grpViz:SuspendLayout().
        THIS-OBJECT:SuspendLayout().
        /*  */
        /* grpTenant */
        /*  */
        THIS-OBJECT:grpTenant:Controls:Add(THIS-OBJECT:grpDashboard).
        THIS-OBJECT:grpTenant:Controls:Add(THIS-OBJECT:grpViz).
        THIS-OBJECT:grpTenant:Controls:Add(THIS-OBJECT:btnShowInsights).
        THIS-OBJECT:grpTenant:Controls:Add(THIS-OBJECT:btnShowCopilot).
        THIS-OBJECT:grpTenant:Controls:Add(THIS-OBJECT:btnFull).
        THIS-OBJECT:grpTenant:Controls:Add(THIS-OBJECT:txtTenant).
        THIS-OBJECT:grpTenant:Dock = System.Windows.Forms.DockStyle:Fill.
        THIS-OBJECT:grpTenant:Location = NEW System.Drawing.Point(0, 0).
        THIS-OBJECT:grpTenant:Name = "grpTenant".
        THIS-OBJECT:grpTenant:Size = NEW System.Drawing.Size(491, 398).
        THIS-OBJECT:grpTenant:TabIndex = 0.
        THIS-OBJECT:grpTenant:TabStop = FALSE.
        THIS-OBJECT:grpTenant:Text = "Tenant".
        THIS-OBJECT:grpTenant:UseCompatibleTextRendering = TRUE.
        /*  */
        /* grpDashboard */
        /*  */
        DEFINE VARIABLE nestedvar0 AS System.Windows.Forms.AnchorStyles NO-UNDO.
        nestedvar0 = CAST(Progress.Util.EnumHelper:Or(CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:grpDashboard:Anchor = CAST(Progress.Util.EnumHelper:Or(nestedvar0, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:grpDashboard:Controls:Add(THIS-OBJECT:llDashboardID).
        THIS-OBJECT:grpDashboard:Controls:Add(THIS-OBJECT:btnShowDashboard).
        THIS-OBJECT:grpDashboard:Controls:Add(THIS-OBJECT:txtDashboardID).
        THIS-OBJECT:grpDashboard:Controls:Add(THIS-OBJECT:lblDashboardID).
        THIS-OBJECT:grpDashboard:Location = NEW System.Drawing.Point(13, 265).
        THIS-OBJECT:grpDashboard:Name = "grpDashboard".
        THIS-OBJECT:grpDashboard:Size = NEW System.Drawing.Size(465, 127).
        THIS-OBJECT:grpDashboard:TabIndex = 5.
        THIS-OBJECT:grpDashboard:TabStop = FALSE.
        THIS-OBJECT:grpDashboard:Text = "Dashboard".
        THIS-OBJECT:grpDashboard:UseCompatibleTextRendering = TRUE.
        /*  */
        /* llDashboardID */
        /*  */
        DEFINE VARIABLE nestedvar1 AS System.Windows.Forms.AnchorStyles NO-UNDO.
        nestedvar1 = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:llDashboardID:Anchor = CAST(Progress.Util.EnumHelper:Or(nestedvar1, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:llDashboardID:Location = NEW System.Drawing.Point(7, 98).
        THIS-OBJECT:llDashboardID:Name = "llDashboardID".
        THIS-OBJECT:llDashboardID:Size = NEW System.Drawing.Size(452, 23).
        THIS-OBJECT:llDashboardID:TabIndex = 7.
        THIS-OBJECT:llDashboardID:TabStop = TRUE.
        THIS-OBJECT:llDashboardID:Text = "How do I find the ID of my dashboard?".
        THIS-OBJECT:llDashboardID:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:llDashboardID:LinkClicked:Subscribe(THIS-OBJECT:llDashboardID_LinkClicked).
        /*  */
        /* btnShowDashboard */
        /*  */
        DEFINE VARIABLE nestedvar2 AS System.Windows.Forms.AnchorStyles NO-UNDO.
        nestedvar2 = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:btnShowDashboard:Anchor = CAST(Progress.Util.EnumHelper:Or(nestedvar2, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:btnShowDashboard:Location = NEW System.Drawing.Point(7, 68).
        THIS-OBJECT:btnShowDashboard:Name = "btnShowDashboard".
        THIS-OBJECT:btnShowDashboard:Size = NEW System.Drawing.Size(452, 23).
        THIS-OBJECT:btnShowDashboard:TabIndex = 6.
        THIS-OBJECT:btnShowDashboard:Text = "Show Dashboard".
        THIS-OBJECT:btnShowDashboard:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:btnShowDashboard:UseVisualStyleBackColor = TRUE.
        THIS-OBJECT:btnShowDashboard:Click:Subscribe(THIS-OBJECT:btnShowDashboard_Click).
        /*  */
        /* txtDashboardID */
        /*  */
        DEFINE VARIABLE nestedvar3 AS System.Windows.Forms.AnchorStyles NO-UNDO.
        nestedvar3 = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:txtDashboardID:Anchor = CAST(Progress.Util.EnumHelper:Or(nestedvar3, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:txtDashboardID:Location = NEW System.Drawing.Point(7, 41).
        THIS-OBJECT:txtDashboardID:Name = "txtDashboardID".
        THIS-OBJECT:txtDashboardID:Size = NEW System.Drawing.Size(452, 20).
        THIS-OBJECT:txtDashboardID:TabIndex = 5.
        THIS-OBJECT:txtDashboardID:Text = "a4019f2a-11f5-4e6c-8543-f4be336f365b".
        /*  */
        /* lblDashboardID */
        /*  */
        THIS-OBJECT:lblDashboardID:Location = NEW System.Drawing.Point(6, 21).
        THIS-OBJECT:lblDashboardID:Name = "lblDashboardID".
        THIS-OBJECT:lblDashboardID:Size = NEW System.Drawing.Size(100, 23).
        THIS-OBJECT:lblDashboardID:TabIndex = 4.
        THIS-OBJECT:lblDashboardID:Text = "Dashboard ID".
        THIS-OBJECT:lblDashboardID:UseCompatibleTextRendering = TRUE.
        /*  */
        /* grpViz */
        /*  */
        DEFINE VARIABLE nestedvar4 AS System.Windows.Forms.AnchorStyles NO-UNDO.
        nestedvar4 = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:grpViz:Anchor = CAST(Progress.Util.EnumHelper:Or(nestedvar4, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:grpViz:Controls:Add(THIS-OBJECT:llVisID).
        THIS-OBJECT:grpViz:Controls:Add(THIS-OBJECT:btnVis).
        THIS-OBJECT:grpViz:Controls:Add(THIS-OBJECT:txtVisID).
        THIS-OBJECT:grpViz:Controls:Add(THIS-OBJECT:lblVisID).
        THIS-OBJECT:grpViz:Location = NEW System.Drawing.Point(13, 134).
        THIS-OBJECT:grpViz:Name = "grpViz".
        THIS-OBJECT:grpViz:Size = NEW System.Drawing.Size(465, 124).
        THIS-OBJECT:grpViz:TabIndex = 4.
        THIS-OBJECT:grpViz:TabStop = FALSE.
        THIS-OBJECT:grpViz:Text = "Visualisation".
        THIS-OBJECT:grpViz:UseCompatibleTextRendering = TRUE.
        /*  */
        /* llVisID */
        /*  */
        DEFINE VARIABLE nestedvar5 AS System.Windows.Forms.AnchorStyles NO-UNDO.
        nestedvar5 = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:llVisID:Anchor = CAST(Progress.Util.EnumHelper:Or(nestedvar5, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:llVisID:Location = NEW System.Drawing.Point(7, 98).
        THIS-OBJECT:llVisID:Name = "llVisID".
        THIS-OBJECT:llVisID:Size = NEW System.Drawing.Size(452, 23).
        THIS-OBJECT:llVisID:TabIndex = 3.
        THIS-OBJECT:llVisID:TabStop = TRUE.
        THIS-OBJECT:llVisID:Text = "How do I find the ID of my visualisation?".
        THIS-OBJECT:llVisID:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:llVisID:LinkClicked:Subscribe(THIS-OBJECT:llVisID_LinkClicked).
        /*  */
        /* btnVis */
        /*  */
        DEFINE VARIABLE nestedvar6 AS System.Windows.Forms.AnchorStyles NO-UNDO.
        nestedvar6 = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:btnVis:Anchor = CAST(Progress.Util.EnumHelper:Or(nestedvar6, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:btnVis:Location = NEW System.Drawing.Point(7, 68).
        THIS-OBJECT:btnVis:Name = "btnVis".
        THIS-OBJECT:btnVis:Size = NEW System.Drawing.Size(452, 23).
        THIS-OBJECT:btnVis:TabIndex = 2.
        THIS-OBJECT:btnVis:Text = "Show Visualisation".
        THIS-OBJECT:btnVis:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:btnVis:UseVisualStyleBackColor = TRUE.
        THIS-OBJECT:btnVis:Click:Subscribe(THIS-OBJECT:btnVis_Click).
        /*  */
        /* txtVisID */
        /*  */
        DEFINE VARIABLE nestedvar7 AS System.Windows.Forms.AnchorStyles NO-UNDO.
        nestedvar7 = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:txtVisID:Anchor = CAST(Progress.Util.EnumHelper:Or(nestedvar7, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:txtVisID:Location = NEW System.Drawing.Point(7, 41).
        THIS-OBJECT:txtVisID:Name = "txtVisID".
        THIS-OBJECT:txtVisID:Size = NEW System.Drawing.Size(452, 20).
        THIS-OBJECT:txtVisID:TabIndex = 1.
        THIS-OBJECT:txtVisID:Text = "29a70f82-1f9e-4d69-95bb-445957ab7990".
        /*  */
        /* lblVisID */
        /*  */
        THIS-OBJECT:lblVisID:Location = NEW System.Drawing.Point(6, 21).
        THIS-OBJECT:lblVisID:Name = "lblVisID".
        THIS-OBJECT:lblVisID:Size = NEW System.Drawing.Size(100, 23).
        THIS-OBJECT:lblVisID:TabIndex = 0.
        THIS-OBJECT:lblVisID:Text = "Visualisation ID".
        THIS-OBJECT:lblVisID:UseCompatibleTextRendering = TRUE.
        /*  */
        /* btnShowInsights */
        /*  */
        DEFINE VARIABLE nestedvar8 AS System.Windows.Forms.AnchorStyles NO-UNDO.
        nestedvar8 = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:btnShowInsights:Anchor = CAST(Progress.Util.EnumHelper:Or(nestedvar8, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:btnShowInsights:Location = NEW System.Drawing.Point(12, 104).
        THIS-OBJECT:btnShowInsights:Name = "btnShowInsights".
        THIS-OBJECT:btnShowInsights:Size = NEW System.Drawing.Size(466, 23).
        THIS-OBJECT:btnShowInsights:TabIndex = 3.
        THIS-OBJECT:btnShowInsights:Text = "Show Insights".
        THIS-OBJECT:btnShowInsights:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:btnShowInsights:UseVisualStyleBackColor = TRUE.
        THIS-OBJECT:btnShowInsights:Click:Subscribe(THIS-OBJECT:btnShowInsights_Click).
        /*  */
        /* btnShowCopilot */
        /*  */
        DEFINE VARIABLE nestedvar9 AS System.Windows.Forms.AnchorStyles NO-UNDO.
        nestedvar9 = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:btnShowCopilot:Anchor = CAST(Progress.Util.EnumHelper:Or(nestedvar9, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:btnShowCopilot:Location = NEW System.Drawing.Point(13, 75).
        THIS-OBJECT:btnShowCopilot:Name = "btnShowCopilot".
        THIS-OBJECT:btnShowCopilot:Size = NEW System.Drawing.Size(466, 23).
        THIS-OBJECT:btnShowCopilot:TabIndex = 2.
        THIS-OBJECT:btnShowCopilot:Text = "Show Copilot".
        THIS-OBJECT:btnShowCopilot:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:btnShowCopilot:UseVisualStyleBackColor = TRUE.
        THIS-OBJECT:btnShowCopilot:Click:Subscribe(THIS-OBJECT:btnShowCopilot_Click).
        /*  */
        /* btnFull */
        /*  */
        DEFINE VARIABLE nestedvar10 AS System.Windows.Forms.AnchorStyles NO-UNDO.
        nestedvar10 = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:btnFull:Anchor = CAST(Progress.Util.EnumHelper:Or(nestedvar10, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:btnFull:Location = NEW System.Drawing.Point(13, 46).
        THIS-OBJECT:btnFull:Name = "btnFull".
        THIS-OBJECT:btnFull:Size = NEW System.Drawing.Size(466, 23).
        THIS-OBJECT:btnFull:TabIndex = 1.
        THIS-OBJECT:btnFull:Text = "Show Full UI".
        THIS-OBJECT:btnFull:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:btnFull:UseVisualStyleBackColor = TRUE.
        THIS-OBJECT:btnFull:Click:Subscribe(THIS-OBJECT:btnFull_Click).
        /*  */
        /* txtTenant */
        /*  */
        DEFINE VARIABLE nestedvar11 AS System.Windows.Forms.AnchorStyles NO-UNDO.
        nestedvar11 = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:txtTenant:Anchor = CAST(Progress.Util.EnumHelper:Or(nestedvar11, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        THIS-OBJECT:txtTenant:Location = NEW System.Drawing.Point(12, 19).
        THIS-OBJECT:txtTenant:Name = "txtTenant".
        THIS-OBJECT:txtTenant:Size = NEW System.Drawing.Size(467, 20).
        THIS-OBJECT:txtTenant:TabIndex = 0.
        THIS-OBJECT:txtTenant:Text = "demo".
        /*  */
        /* main */
        /*  */
        THIS-OBJECT:ClientSize = NEW System.Drawing.Size(491, 398).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:grpTenant).
        THIS-OBJECT:MinimumSize = NEW System.Drawing.Size(318, 437).
        THIS-OBJECT:Name = "main".
        THIS-OBJECT:Text = "inmydata component demo".
        THIS-OBJECT:grpTenant:ResumeLayout(FALSE).
        THIS-OBJECT:grpTenant:PerformLayout().
        THIS-OBJECT:grpDashboard:ResumeLayout(FALSE).
        THIS-OBJECT:grpDashboard:PerformLayout().
        THIS-OBJECT:grpViz:ResumeLayout(FALSE).
        THIS-OBJECT:grpViz:PerformLayout().
        THIS-OBJECT:ResumeLayout(FALSE).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.
	END METHOD.

	/* --- LinkLabel Click Handlers to Open Help URL --- */
	@VisualDesigner.
	METHOD PRIVATE VOID llDashboardID_LinkClicked( INPUT sender AS System.Object, INPUT e AS System.Windows.Forms.LinkLabelLinkClickedEventArgs ):
		OS-COMMAND SILENT START "https://developer.inmydata.com/a/solutions/articles/36000577000?portalId=36000061664".
		RETURN.

	END METHOD.

	@VisualDesigner.
	METHOD PRIVATE VOID llVisID_LinkClicked( INPUT sender AS System.Object, INPUT e AS System.Windows.Forms.LinkLabelLinkClickedEventArgs ):
		OS-COMMAND SILENT START "https://developer.inmydata.com/a/solutions/articles/36000577000?portalId=36000061664".
		RETURN.

	END METHOD.

	DESTRUCTOR PUBLIC main ( ):

	END DESTRUCTOR.

END CLASS.