# SENSOR HEALTH MONITORING
## master thesis

<iframe width="100%" height="800" src="D:\working_dir\MA\ma-thesis\out\main.pdf">















# WZL Latex 
*Template, requirements, tools & tricks*  
*Contact:* Amon Göppert (gpp)

**Info**  
This is an examplary LaTeX project with .tex and .bib files as a template for writing final reports, theses or dissertations in WZL style.
The formatting rules and parameters are located in the  `WZLtemplate.cls` file, which is designed according to the
[WZL Word template](https://wzl-lotus3.wzl.rwth-aachen.de/cms/handbuch/de/216cfa733631c02ac1257c20003627df/ma_vorlage_wzl_deutsch_duplex.docx) from  this [Handbuch page](https://wzl-lotus3.wzl.rwth-aachen.de/cms/handbuch/de/216cfa733631c02ac1257c20003627df.htm). Also, the [RWTH/WZL-Deckblatt](https://wzl-lotus3.wzl.rwth-aachen.de/cms/handbuch/de/216cfa733631c02ac1257c20003627df/deckblattundformularlogoverwendung.pdf) and the [Themenstellung](https://wzl-lotus3.wzl.rwth-aachen.de/cms/handbuch/de/216cfa733631c02ac1257c20003627df/ma_themenstellung_de.docx) are integrated as PDF and .tex file, respectively.

## Getting started

### Requirements
**Online TeX-System & IDE**  
For a fully integrated web-based TeX and IDE system check-out: [Overleaf](https://www.overleaf.com/)  
The master branch of this repository is pushed to this public Overleaf project: [wzl-latex project](https://www.overleaf.com/read/ydwhkjfbhksc)  

Disadvantages of overleaf are the necessary figure and literature uploads.  
Advantages are the out-of-the-box usage withouth required software installations described in the following.

**TeX system**  
For compiling .tex-files locally, a TeX-System is required. Install one of the following, based on your OS:  
* Windows/Linux: [TeX Live](https://www.tug.org/texlive/)
* Mac: [MacTeX](http://www.tug.org/mactex/)


**IDE**  
For proper .tex-files editing an IDE is needed. Install one of the following:  
* [Texstudio](https://www.texstudio.org/) (recommended)
* [Texmaker](https://www.xm1math.net/texmaker/)

Make sure that in the configurations of the IDE 'biber' is selected as backend.

### First steps

When working with a local TeX System and IDE, download or clone this repository to your empty project directory:  
Clone with tls/https (requires your Gitlab login):  
`git clone https://git-ce.rwth-aachen.de/wzl-mq-ms/forschung-lehre/wzl-latex.git`  

Clone with tls/https (requires an ssh-configuration for the connection of your local machine and Gitlab. Explanation [here](https://docs.gitlab.com/ee/ssh/)):  
`git clone git@git-ce.rwth-aachen.de:wzl-mq-ms/forschung-lehre/wzl-latex.git`


Compile the main.tex-file with your IDE and consider the resulting PDF for further explanations.

The Deckblattundformularlogoverwendung PDF might not be included properly. Please print the PDF after filling your data as a PDF with a common PDF printer. Afterwards include this new PDF.

## Helpful tools
### Literature management
For managing your bibliography this tool is recommended:

* [JabRef](https://www.jabref.org/)

It works directly on your .bib-database and comes with useful features such as DOI-import, integrated Google Scholar search and discovery of related articles with [Mr. DLib](http://mr-dlib.org/).

For the automatic Bibtexkey generation according to the WZL style (e.g. MUST13) change the following:  
Options > Preferences > BibTeX key generator  >  Change the key pattern of the default pattern to:  
`[auth4:upper][shortyear]`

### Fonts

CMU Serif can be installed and used e.g. for creating figures in ppt with a font that is very similar to the standard Tex font, if the serif font is used.
https://fontlibrary.org/en/font/cmu-serif
