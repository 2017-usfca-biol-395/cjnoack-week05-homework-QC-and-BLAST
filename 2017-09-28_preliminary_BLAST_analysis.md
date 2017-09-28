# Preliminary Blast Analysis

The following is an analysis of data collected by Fierer et al. The study asked how efficiently one can match bacteria found on an object to the skin-associated bacteria found on the individual who touched the object. The objects used in the study were single computer keys and computer mice. 

### QC Analysis
Every sequence was run through a quality check analysis to ensure our data is useable for analysis. 

A common, albiet unsurprising, pattern was a degredation as the sequences got closer to the 3' end. However, the degree in which the sequences degraded varied. For example:

In sequence ERR1942280, we see that the mean quality of scores for the bases were approximately 36, which is a well-above average score. In other scores such as ERR1942282, the average was 35. While this indicates that both sequences achieved a great sequence score, when looking at the data distribution visually, they look quite different. ERR-80 has tiny spreads with minimal data to report, giving it the appearance of nearly perfect reads. ERR-82 has much more data to report with a larger spread, also providing a decieving appearance that it is a low-quality sequence. In reality, most of the sequences provided by Fierer et al. are above 30 and thus very good.

### Organisms Found in BLAST

Based on the BLAST, the following organisms were found in abundance in the sequences listed below:
  - ERR-80: Bacteroidetes endosymbiont of Metaseiulus occidentalis with a range of 97.76-99.55% identity match.
  - ERR-81: There was no visible strain dominating all others and many strains exhibited a 100% identity match. (Arthrobacter, Azonexus hydrophilus, Azospirillum halopraeferens, Bacillus sp. MS5, Brevibacterium antarcticum, Clavibacter sp. x1-5, Corynebacterium tuberculostearicum, Eubacterium brachy, etc...).
  - ERR-82: Spiroplasma corruscae with a range of 95.39-97.46% identity match.
  - ERR-83: There was no visible strain dominating all others and many strains exhibited a 100% identity match. (Acidovorax, Acidovorax temperans, Cloacibacterium normanense, etc...). 
  - ERR-84: Solemya pervernicosa gill symbiont with a range of 85.53-86.16% identity match.
  - ERR-85: Bartonella washoensis with a range of 93.42-100% identity match.
  - ERR-86: Solemya pervernicosa gill symbiont with a range of 80.82-86.79% identity match.
  - ERR-87: Bartonella washoensis with a range of 93.81-100% identity  match.
  - ERR-88: Bacteroidetes endosymbiont of Metaseiulus occidentalis with a range of 99.07-100% identity match.
  - ERR-89: There was no visible strain dominating all others and many strains exhibited a 100% identity match. (Acinetobacter sp. D75, Aeromicrobium sp. PclMES3, Arthrobacter sp., Propionibacterium acnes subsp. acnes, etc...). 
  - ERR-90: There was no visible strain dominating all others and many strains exhibited a 100% identity match. (Acinetobacter guillouiae, Massilia sp. 8B-2, Streptomyces sp., etc...). 
  - ERR-91: Pinus oocarpa with a range of 99.55-100% identity match and Solemya pervernicosa gill symbiont with a range of 85.53-86.79% identity match.
  - ERR-92: Bartonella washoensis with a range of 99.55-100% identity match.
  - ERR-93: Acidovorax sp. with a range of 99.56-100% identity match and genus Acinetobacter (indicus and junii) with a range of 96.41-100% identity match.
  - ERR-94: Pinus oocarpa with a range of 95.40-100% identity match and Staphylococcus succinus with a range of 96.68-100% identity match.
  - ERR-95: Solemya pervernicosa gill symbiont with a range of 81.28-86.16% identity match.
  - ERR-96: Bartonella washoensis with a range of 94.63-100% identity match.
  - ERR-97: Solemya pervernicosa gill symbiont with a range of 85.53-86.79% identity match.
  - ERR-98: This sequence not only had a mix of identifiable strains but also had a majority of many unidentified or unnamed bacteria strains.
  - ERR-99: Aquitalea sp. KJ011 with a 92.11-95.31% identity match and Solemya pervernicosa gill symbiont with a range of 81.31-86.79% identity match.

### Analysis of My Findings

First noticeable aspect about the BLAST findings are the reoccurance of certain bacterial strains. For example, Solemya pervernicosa gill symbiont clearly shows dominance over approximately four strains. Solemya pervernicosa is a gutless-awning clam found primarily in sewage outfalls and places with woody debris; [EOL](http://eol.org/pages/450138/details). Thus, this bacteria is found in the gills of gutless-awning clams performing symbiosis. I'm skeptical as to *why* and *how* the bacteria found its way onto either the mouse or the human, but I think the clear assumption is that a lot of mice go through sewage systems and might pick up the same bacteria where many sewage outfall dwelling clams live whom have this gill symbiont.

Another example is the 
