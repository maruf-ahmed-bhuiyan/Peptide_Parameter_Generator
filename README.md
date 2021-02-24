<h2 align="center"> Peptide Parameter Generator </h2>
<h2 align="center"> This is a bash script that generates the count of aromatic,  polar, non polar, acidic and basic residues from a text file containing the peptide sequences.</h2>
<h3 align="center"> Don't forget to hit the Star button if you liked it. </h3>
<h4 align="center"> The amino acids were classified according to the following guideline. This is taken from Lehninger Principle of Biochemistry </h4>
<p align="center">
  <img width="650" height="700" src="https://github.com/maruf-ahmed-bhuiyan/Peptide_Parameter_Generator/blob/main/reference.png">
</p>

### Instructions:
- Download the paramgen.sh file
- Copy all your peptides sequences in a text file

<p align="center">
  <img width="450" height="500" src="https://github.com/maruf-ahmed-bhuiyan/Peptide_Parameter_Generator/blob/main/peptides.png" alt="peptides.txt">
</p>

- Place it in the same folder as the paramge.sh file
- Open a terminal and navigate to the folder where the the script and text file is located or open a terminal directly from the location of the folder
- Make the paramgen.sh script executable (if not already) by typing
```bash
chmod +x paramgen.sh
```
- Finally, run the script by typing
```bash
# ./paramgen.sh <type_your_filename>
# For example if you saved the peptide sequences in peptides.txt file
./paramgen.sh peptides.txt
```
- A tsv file will be generated named peptide_param.tsv
- Open the file in excel

| Sequence                                         | Length | Aromatic | Negatively Charged | Positively Charged | Polar | Non-polar |
|--------------------------------------------------|--------|----------|--------------------|--------------------|-------|-----------|
| GIPCAESCVYIPCTVTALLGCSCSNRVCYN                   | 30     | 2        | 1                  | 1                  | 13    | 13        |
| GIPCGESCVWIPCISSAIGCSCKSKVCYRN                   | 30     | 2        | 1                  | 3                  | 12    | 12        |
| GIPCGESCVWIPCLTSAIGCSCKSKVCYRN                   | 30     | 2        | 1                  | 3                  | 12    | 12        |
| GIPCGESCVWIPCISSAIGCSCKNKVCYRN                   | 30     | 2        | 1                  | 3                  | 12    | 12        |
| GTPCGESCVWIPCISSAVGCSCKNKVCYKN                   | 30     | 2        | 1                  | 3                  | 11    | 13        |
| GTLPCGESCVWIPCISAVGCSCKSKVCYKN                   | 30     | 2        | 1                  | 3                  | 12    | 12        |
| SIPCGESCVWIPCTITALAGCKCKSKVCYN                   | 30     | 2        | 1                  | 3                  | 12    | 12        |
| GTLPCESCVWIPCISSVVGCSCKSKVCYKN                   | 30     | 2        | 1                  | 3                  | 11    | 13        |
| GLPVCGETCVGGTCNTPGCTCSWPVCTRN                    | 29     | 1        | 1                  | 1                  | 12    | 14        |
| FRGLAKLLKIGLKSFARVLKKVLPKAAKAGKALAKSMADENAIRQQNQ | 48     | 2        | 2                  | 12                 | 25    | 7         |
| GKFSGFAKILKSIAKFFKGVGKVRKQFKEASDLDKNQ            | 37     | 5        | 3                  | 10                 | 13    | 6         |
| GKLSGISKVLRAIAKFFKGVGKARKQFKEASDLDKNQ            | 37     | 3        | 3                  | 10                 | 15    | 6         |
| GKFSVFSKILRSIAKVFKGVGKVRKQFKTASDLDKNQ            | 37     | 4        | 2                  | 10                 | 13    | 8         |
| GFGALFKFLAKKVAKTVAKQAAKQGAKYVVNKQME              | 35     | 4        | 1                  | 8                  | 17    | 5         |
| GFGSLFKFLAKKVAKTVAKQAAKQGAKYIANKQME              | 35     | 4        | 1                  | 8                  | 16    | 6         |

- Enjoy !!


<h3 align="center"> Hello, This is Maruf Ahmed Bhuiyan </h3>
<h4 align="center"> I am a doctor by profession and a researcher by passion. I am currently pursuing my Doctor of Medicine (MD) in Virology in the Department of Virology at Bangabandhu Sheikh Mujib Medical University. I am passionate about impactful research and constantly on the hunt to acquire new skills. </h4>

- I are currently working on **Genomics, Vaccinomics, Computer Aided Drug Design, Machine Learning, Data Analaysis, Interactomics**

- Ask me about **Anything Science! I am passionate about talking science**

- How to reach me? **dr.maruahmed89@gmail.com**

- My webste: www.marufahmed.carrd.co

- Fun fact: **I Love Programming**

<p align="center">
  <a href="https://opensource.org/licenses/MIT">
    <img src="https://img.shields.io/badge/License-MIT-blue.svg"
  </a>
</p>

<h1 

![Footer](https://github.com/maruf-ahmed-bhuiyan/Peptide_Parameter_Generator/blob/main/blue-footer.png)
