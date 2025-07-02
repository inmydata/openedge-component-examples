# inmydata Desktop Components – OpenEdge GUI Client Demo

This repository contains a working example of how to embed and use **inmydata's Windows Forms analytics components** in a **Progress OpenEdge GUI for .NET application**.

It demonstrates how to load dashboards, visualisations, AI chat, and insights using the `AnalyticsControl` component from inmydata.

---

## 🔧 Prerequisites

To run this example, you'll need:

- **Progress OpenEdge 12.2 or later**
- GUI for .NET client support enabled
- Access to the `inmydata.WindowsForms.Library.dll`
- A valid **inmydata tenant ID**
- Optionally: Dashboard and Visualisation IDs (provided in `main.cls`)

> Refer to the [inmydata documentation](https://developer.inmydata.com/support/solutions/articles/36000552424) for setup and architecture details.

---

## 🚀 Getting Started

1. Clone this repository into your OpenEdge workspace.
2. Download and install the [inmydata components](https://download.inmydata.ai/inmydata.WindowsForms.Installer.msi) 
3. Optionally, in Developer Studio add the Analytiocs Conttrol to the Toolbox
   - Open any form with the OpenEdge Visual Designer
   - Right click in the Toolbox and select Add Control Group, enter inmydata and press return
   - Right click in the Toolbox and select Add Controls
   - Select the Control Group inmydata
   - TYpe Analytics in the Filter text box
   - In the Global Assemblies tab, check the checkbox next to the control AnalyticsControl in the namespace inmydata.WindowsForms.Library and press OK
3. Add required references to the to your project:
   - Make sure assemblies.dll contains the following ...
	<assembly name="inmydata.WindowsForms.Library, Version=1.0.0.0, Culture=neutral, PublicKeyToken=356852478171bdea"/>
    <assembly name="Microsoft.VisualBasic, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"/>
    <assembly name="Microsoft.InteropFormTools, Version=1.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"/>
    <assembly name="Microsoft.Web.WebView2.WinForms, Version=1.0.2849.39, Culture=neutral, PublicKeyToken=2a8ab48044d2601e"/>
    <assembly name="Microsoft.Web.WebView2.Core, Version=1.0.2849.39, Culture=neutral, PublicKeyToken=2a8ab48044d2601e"/>
    <assembly name="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"/>
4. Compile all `.cls` files in the OpenEdge editor.
5. Open and run the `main.cls` form.
6. Enter your tenant and (optionally) dashboard or visualisation IDs, then click the respective buttons to launch different components.

---

## 📂 Project Structure

| File | Description |
|------|-------------|
| `main.cls` | Launchpad form with buttons to open each component |
| `full.cls` | Opens the full analytics control view |
| `dashboard.cls` | Loads a dashboard with optional drilldown suppression |
| `visualisation.cls` | Displays a single visualisation with configurable toolbar/tool options |
| `insights.cls` | Loads a list of insights with click-to-view detail |
| `insightsViz.cls` | Displays a visualisation for a selected insight |
| `aiChat.cls` | Shows the AI assistant and supports interactive chart responses |
| `aiChatViz.cls` | Loads a visualisation suggested by AI Chat |

---

## 🧠 How It Works

Each form uses the `AnalyticsControl` and sets:

- `Tenant` – to scope data
- `ContentType` – one of: `Full`, `Dashboard`, `Visualisation`, `AIChat`, etc.
- Optional IDs like `ID`, `InsightChartID`, or `AIChatChartID`

All content is loaded dynamically when the form appears using:
```abl
analyticsControl:LoadView().
Forms like dashboard and visualisation include a menu strip for toggling settings at runtime (e.g. read-only, toolbar visibility, suppress drilldowns).

📌 For more help see https://developer.inmydata.com


📝 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

🙋 Need Help?
If you're new to inmydata's components, check out the Developer Portal or raise a support request via your inmydata tenant.
