# DJRef
A (very) simple but complicated tool for retrieving all article references from a scientific paper. Requires some coding knowledge.

# How it works
You copy a list of references from pdf or wherever and save the references in a text file. Edit the text file (source.txt) appropriately.
The script uses Google Chrome along with your Google Scholar page to click the star button when a search is done to add the files to your library.
You navigate to your library and then click the BibTex button upon which the script will append the file "Citations.txt" page by page with the BibTex formatted references.
You use the Citations.txt file to import the citations to your Mendeley library or wherever.

# Requirements
You need to first determine the (relative) mouse position of the various buttons on a full screen Chrome Window navigated and logged into Google Scholar and edit your DJRef.ahk file with the relelvant mouse positions.
Download WindowSpy from AHK if you don't have it yet.
You need 2 .txt files in the root directory of the script file:
1. source.txt
2. Citations.txt

# Steps
You need to have copied the list of references from the article (example a pdf) to a text file called source.txt.  Manipulate the source references as such that each reference is in its own line.

# eg.:

Delanaye P, Nellessen E, Grosch S et al, Creatinine-based formulae for the estimation of glomerular filtration rate in heart transplant recipients, Clin Transplant 2006; 20: 596?603,,
# Newline
Masson I, Flamant M, Maillard N et al, MDRD versus CKD-EPI equation to estimate glomerular filtration rate in kidney transplant recipients, Transplantation 2013; 95: 1211?1217,,
# Newline
Luis-Lima S, Marrero-Miranda D, Gonz�lez-Rinne A et al, Estimated glomerular filtration rate in renal transplantation:the nephrologist in the mist, Transplantation 2015; 99: 2625?2633,,
# Newline
Beben T, Rifkin DE, GFR estimating equations and liver disease,Adv Chronic Kidney Dis 2015; 22: 337?342,,

# Steps (continued)
Then open Google Chrome (other browser won't work) and navigate and log into your Google Scholar account and make the window full screen.

With all set, when you hit the "Go" button it should start searching article for article and hitting the "star" button to save the articles to your library.

When all is done, you navigate with Chrome to your library, then hit the "BibTex" button and it should start appending the file "Citations.txt" with all the Bibtex references in your Google scholar library.

#Who said referencing isn't fun!
