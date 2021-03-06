﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                exclude-result-prefixes="msxsl"
                
                xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <xsl:output method="html" indent="yes" encoding="utf-8"/>


    <xsl:param name="titleStyleId" />
  <!--注意在以下select表达式中 @w:val=$titleStyleId 不能写成 @w:val='$titleStyleId' 即在xsl表达式中参数不能带引号 -->
  <xsl:variable name="title" select="//w:p[w:pPr/w:pStyle/@w:val=$titleStyleId]" />
  <xsl:template match="/">
    <div class="container">
      <div id="main" class="grid">
        <!--文章主体部分-->
        <div  class="main__content grid__col grid__col--xs-12 grid__col--md-9" id="main-content">
          <div class="block" id="Test-ImgSrc">
            <!--最上面的Research Article 和Open Access-->
            <div class="FulltextWrapper">
              <div class="Categories">
                <div class="ArticleCategory">Research article</div>
                <div class="OpenAccessLabel">Open Access</div>
              </div>
            </div>
            <!--文章开始 标题 作者 DOI...-->
            <div class="FulltextWrapper">
              <!--标题,此时的标题是显示纯文本，但是bio里面有强调，暂且如此-->
              <div xmlns="" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:meta="http://www.springer.com/app/meta" class="MainTitleSection">
                <h1 xmlns="http://www.w3.org/1999/xhtml" class="ArticleTitle" lang="en">
                  <xsl:value-of select="$title"/>
                  <!--注意:此处bio的标题有重点突出标签-->
                </h1>
              </div>

              <!--作者名字，单位，邮箱等等，注意第一作者好像提供邮箱-->
              <div xmlns="" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:meta="http://www.springer.com/app/meta" class="AuthorNames">
                <ul class="u-listReset">
                  <li class="Author" data-jumpto="Aff">
                    <span xmlns="http://www.w3.org/1999/xhtml" class="AuthorName">Tadesse&nbsp;Eguale</span><sup>
                      <a href="#Aff1" class="AffiliationID">1</a>
                    </sup><a href="mailto:tadesse.eguale@aau.edu.et" class="EmailAuthor" title="Email author">
                      <span class="ContactIcon" aria-hidden="true"></span>
                      <span class="u-srOnly">Email author</span>
                    </a>,
                  </li>
                  <li class="Author" data-jumpto="Aff">
                    <span xmlns="http://www.w3.org/1999/xhtml" class="AuthorName">Wondwossen&nbsp;A.&nbsp;Gebreyes</span><sup>
                      <a href="#Aff2" class="AffiliationID">2</a>
                    </sup>,
                  </li>
                  <li class="Author" data-jumpto="Aff">
                    <span xmlns="http://www.w3.org/1999/xhtml" class="AuthorName">Daniel&nbsp;Asrat</span><sup>
                      <a href="#Aff3" class="AffiliationID">3</a>
                    </sup>,
                  </li>
                  <li class="Author" data-jumpto="Aff">
                    <span xmlns="http://www.w3.org/1999/xhtml" class="AuthorName">Haile&nbsp;Alemayehu</span><sup>
                      <a href="#Aff1" class="AffiliationID">1</a>
                    </sup>,
                  </li>
                  <li class="Author" data-jumpto="Aff">
                    <span xmlns="http://www.w3.org/1999/xhtml" class="AuthorName">John&nbsp;S.&nbsp;Gunn</span><sup>
                      <a href="#Aff4" class="AffiliationID">4</a>
                    </sup> and
                  </li>
                  <li class="Author" data-jumpto="Aff">
                    <span xmlns="http://www.w3.org/1999/xhtml" class="AuthorName">Ephrem&nbsp;Engidawork</span>
                    <sup>
                      <a href="#Aff5" class="AffiliationID">5</a>
                    </sup>
                  </li>
                </ul>
              </div>
              <div xmlns="" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:meta="http://www.springer.com/app/meta" class="ArticleContextInformation">
                <div class="ContextInformation">
                  <div class="ContextInformationJournalTitles">
                    <span class="ArticleCitation">
                      <span xmlns="http://www.w3.org/1999/xhtml" class="JournalTitle">BMC Infectious Diseases</span>
                      <span class="ArticleCitation_Year">2015</span>
                      <span class="ArticleCitation_Volume">
                        <strong>15</strong>:497
                      </span>
                    </span>
                  </div>
                  <p class="ArticleDOI">
                    <strong>DOI: </strong>10.1186/s12879-015-1235-y
                  </p>
                  <p class="Copyright">© &nbsp;Eguale et al.&nbsp;2015</p>
                </div>
              </div>
              <div class="ArticleHistory">
                <p class="History HistoryReceived">
                  <strong>Received: </strong>12&nbsp;April&nbsp;2015
                </p>
                <p class="History HistoryAccepted">
                  <strong>Accepted: </strong>19&nbsp;October&nbsp;2015
                </p>
                <p class="History HistoryOnlineDate">
                  <strong>Published: </strong>4&nbsp;November&nbsp;2015
                </p>
              </div>
            </div>


            <!--正文不包括引用-->
            <div class="FulltextWrapper">
              <section xmlns="" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:meta="http://www.springer.com/app/meta" class="Abstract" id="Abs1" lang="en">
                <h2 class="Heading js-ToggleCollapseSection">Abstract</h2>
                <div class="js-CollapseSection">
                  <div xmlns="http://www.w3.org/1999/xhtml" class="AbstractSection" id="ASec1">
                    <h3 xmlns="" class="Heading">Background</h3>
                    <p id="Par1" class="Para">
                      Non-typhoidal <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> (NTS) is an important public health problem worldwide. Consumption of animal-derived food products and direct and/or indirect contact with animals are the major routes of acquiring infection with NTS. Published information, particularly on the serotype distribution of NTS among human patients with gastroenteritis and associated risk factors, is scarce in Ethiopia. This study investigated the prevalence, risk factors, serotype distribution and antimicrobial susceptibility of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> species among diarrheic out-patients attending health centers in Addis Ababa and patients with various gastrointestinal complaints at Tikur Anbessa Specialized Hospital (TASH).
                    </p>
                  </div>
                  <div xmlns="http://www.w3.org/1999/xhtml" class="AbstractSection" id="ASec2">
                    <h3 xmlns="" class="Heading">Methods</h3>
                    <p id="Par2" class="Para">
                      Stool samples were cultured for <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> species according to the WHO Global Foodborne Infections Network laboratory protocol. <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> serotyping was conducted using slide agglutination and microplate agglutination techniques. Antibiotic susceptibility testing was performed using the disk diffusion method according to Clinical and Laboratory Standards Institute guidelines.
                    </p>
                  </div>
                  <div xmlns="http://www.w3.org/1999/xhtml" class="AbstractSection" id="ASec3">
                    <h3 xmlns="" class="Heading">Results</h3>
                    <p id="Par3" class="Para">
                      A total of 59 (6.2&nbsp;%) stool samples, out of 957 were culture positive for <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> species. Fifty-five (7.2&nbsp;%) of 765 diarrheic patients from health centers and 4 (2.1&nbsp;%) of 192 patients from TASH were culture positive for <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> species. Multivariable logistic regression analysis after adjusting for all other variables revealed statistically significant association of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> infection with consumption of raw vegetables (OR = 1.91, 95&nbsp;% CI = 1.29–2.83, χ<sup>2</sup> = 4.74, <em xmlns="" class="EmphasisTypeItalic">p =</em> 0.025) and symptom of watery diarrhea (OR = 3.3, 95 % CI = 1.23–8.88, χ<sup>2</sup> = 10.54, <em xmlns="" class="EmphasisTypeItalic">p =</em> 0.005). Eleven serotypes were detected, and the most prominent were <em xmlns="" class="EmphasisTypeItalic">S.</em> Typhimurium (37.3&nbsp;%), <em xmlns="" class="EmphasisTypeItalic">S</em>. Virchow (34&nbsp;%), and <em xmlns="" class="EmphasisTypeItalic">S.</em> Kottbus (10.2&nbsp;%). Other serotypes were <em xmlns="" class="EmphasisTypeItalic">S.</em> Miami, <em xmlns="" class="EmphasisTypeItalic">S.</em> Kentucky, <em xmlns="" class="EmphasisTypeItalic">S</em>. Newport, <em xmlns="" class="EmphasisTypeItalic">S</em>. Enteritidis, <em xmlns="" class="EmphasisTypeItalic">S</em>. Braenderup, <em xmlns="" class="EmphasisTypeItalic">S</em>. Saintpaul, <em xmlns="" class="EmphasisTypeItalic">S</em>. Concord and <em xmlns="" class="EmphasisTypeItalic">S.</em> V:ROUGH-O. Resistance to three or more antimicrobials was detected in 27 (40.3&nbsp;%) of the isolates. Resistance to five or more antimicrobials was detected in 17 (25.4&nbsp;%). Resistance to individual antimicrobials was found at varying proportions: streptomycin (50; 74.6&nbsp;%), nitrofurantoin (27; 40.3&nbsp;%), sulfisoxazole (26; 38.8&nbsp;%), kanamycin (23; 34.3&nbsp;%), cephalothin (12; 17.9&nbsp;%), and ampicillin (11; 16.4&nbsp;%) respectively. Two <em xmlns="" class="EmphasisTypeItalic">S</em>. Kentucky, one <em xmlns="" class="EmphasisTypeItalic">S</em>. Typhimurium and one <em xmlns="" class="EmphasisTypeItalic">S.</em> Concord isolates were multi-drug resistant to more than 10 antimicrobials.
                    </p>
                  </div>
                  <div xmlns="http://www.w3.org/1999/xhtml" class="AbstractSection" id="ASec4">
                    <h3 xmlns="" class="Heading">Conclusions</h3>
                    <p id="Par4" class="Para">
                      The study demonstrated significant association of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> infection with consumption of raw vegetables. There was no significant association of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> infection with co-occurring parasites. The study also showed the dominance of <em xmlns="" class="EmphasisTypeItalic">S.</em> Typhimurium and <em xmlns="" class="EmphasisTypeItalic">S</em>. Virchow in primary health care units. Overall, prevalence of MDR was low compared to previous studies. Although their proportion was low, <em xmlns="" class="EmphasisTypeItalic">S.</em> Kentucky and <em xmlns="" class="EmphasisTypeItalic">S.</em> Concord demonstrated wider spectrum of MDR. Continuous monitoring of circulating serotypes, antimicrobial resistance profile and characterization on molecular resistance determinants is essential for proper treatment of patients and for identifying potential environmental origins of antimicrobial resistance.
                    </p>
                  </div>
                  <div xmlns="http://www.w3.org/1999/xhtml" class="KeywordGroup" lang="en">
                    <h3 xmlns="" class="Heading">Keywords</h3>
                    <span class="Keyword">
                      Non-typhoidal <em xmlns="" class="EmphasisTypeItalic">Salmonella</em>
                    </span>
                    <span class="Keyword">Antimicrobial resistance</span>
                    <span class="Keyword">Prevalence</span>
                    <span class="Keyword">Serotype</span>
                  </div>
                </div>
              </section>
              <section xmlns="" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:meta="http://www.springer.com/app/meta" id="Sec1" class="Section1 RenderAsSection1">
                <h2 class="Heading js-ToggleCollapseSection">Background</h2>
                <div class="js-CollapseSection">
                  <p xmlns="http://www.w3.org/1999/xhtml" id="Par12" class="Para">
                    Non-typhoidal <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> (NTS) is an important public health problem worldwide. Globally, NTS is estimated to be responsible for 93.8 million cases of gastroenteritis and 155,000 deaths annually [<span class="CitationRef">
                      <a href="#CR1">1</a>
                    </span>]. Unlike typhoid fever, which is mainly limited to developing countries, NTS occurs worldwide. Despite global morbidity, mortality due to NTS infection primarily occurs in the developing world and is related to co-morbidities [<span class="CitationRef">
                      <a href="#CR2">2</a>
                    </span>]. Consumption of animal-derived food products and direct and/or indirect contact with animals are the major routes of acquiring infection with NTS [<span class="CitationRef">
                      <a href="#CR3">3</a>
                    </span>–<span class="CitationRef">
                      <a href="#CR6">6</a>
                    </span>]. NTS can also be transmitted from person to person or from contact with pets such as cats, dogs, rodents, reptiles, or amphibians [<span class="CitationRef">
                      <a href="#CR3">3</a>
                    </span>, <span class="CitationRef">
                      <a href="#CR4">4</a>
                    </span>, <span class="CitationRef">
                      <a href="#CR7">7</a>
                    </span>, <span class="CitationRef">
                      <a href="#CR8">8</a>
                    </span>]. Several recent outbreaks have also been associated with consumption of contaminated plant products such as sprouts, tomatoes, fruits, peanuts, and spinach [<span class="CitationRef">
                      <a href="#CR9">9</a>
                    </span>–<span class="CitationRef">
                      <a href="#CR11">11</a>
                    </span>].
                  </p>
                  <p xmlns="http://www.w3.org/1999/xhtml" id="Par13" class="Para">
                    NTS usually causes self-limiting gastroenteritis characterized by diarrhea, abdominal pain and vomiting in people of all ages [<span class="CitationRef">
                      <a href="#CR12">12</a>
                    </span>]. However, in children, the elderly and immunocompromised patients, severe invasive disease with complicated extra-intestinal illness, bacteremia and meningitis can be observed [<span class="CitationRef">
                      <a href="#CR7">7</a>
                    </span>, <span class="CitationRef">
                      <a href="#CR13">13</a>
                    </span>]. Generally, antibiotic treatment is not necessary for NTS gastroenteritis unless it is invasive salmonellosis or it affects immunocompromised patients [<span class="CitationRef">
                      <a href="#CR14">14</a>
                    </span>, <span class="CitationRef">
                      <a href="#CR15">15</a>
                    </span>]. Chemotherapy is believed to prolong the duration of shedding of bacteria and contribute to the development of antimicrobial resistance [<span class="CitationRef">
                      <a href="#CR16">16</a>
                    </span>].
                  </p>
                  <p xmlns="http://www.w3.org/1999/xhtml" id="Par14" class="Para">
                    The relative importance of major etiologic agents responsible for diarrhea is not well established in Ethiopia. A few studies conducted in different parts of the country have shown that <em xmlns="" class="EmphasisTypeItalic">Campylobacter</em>, <em xmlns="" class="EmphasisTypeItalic">Salmonella, Shigella</em> and rotavirus are some of the major bacterial and viral pathogens isolated from stool of diarrheic patients, most of them children under 5&nbsp;years of age [<span class="CitationRef">
                      <a href="#CR17">17</a>
                    </span>–<span class="CitationRef">
                      <a href="#CR20">20</a>
                    </span>].
                  </p>
                  <p xmlns="http://www.w3.org/1999/xhtml" id="Par15" class="Para">
                    Globally, the incidence of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> infection associated with multi-drug resistance (MDR) has increased in the last few decades [<span class="CitationRef">
                      <a href="#CR21">21</a>
                    </span>–<span class="CitationRef">
                      <a href="#CR23">23</a>
                    </span>]. In Ethiopia, although there are a few studies on prevalence of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> and antimicrobial susceptibility in humans, animals, and food of animal origin, there is no integrated surveillance and monitoring to establish the major serotypes responsible for non-typhoidal salmonellosis in humans and the associated risk factors. Moreover, most of the studies conducted in humans involved pediatric diarrheic patients and the isolates recovered from these patients were not sereotyped [<span class="CitationRef">
                      <a href="#CR24">24</a>
                    </span>, <span class="CitationRef">
                      <a href="#CR25">25</a>
                    </span>]. Those that conducted serotyping indicated that <em xmlns="" class="EmphasisTypeItalic">Salmonella enterica</em> subspecies enterica serovar Concord (<em xmlns="" class="EmphasisTypeItalic">S.</em> Concord) and <em xmlns="" class="EmphasisTypeItalic">Salmonella enterica</em> subspecies enterica serovar Typhimurium (<em xmlns="" class="EmphasisTypeItalic">S.</em> Typhimurium) were the dominant NTS serotypes isolated from patients with diarrheal illness in Ethiopia [<span class="CitationRef">
                      <a href="#CR20">20</a>
                    </span>, <span class="CitationRef">
                      <a href="#CR26">26</a>
                    </span>].
                  </p>
                  <p xmlns="http://www.w3.org/1999/xhtml" id="Par16" class="Para">
                    Information on <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> serotypes circulating in a given geographic area and their antimicrobial susceptibility is essential for designing appropriate intervention strategy since the outcome of infection varies with serotypes involved and their antimicrobial resistance profile. The objectives of the current study were therefore to investigate the prevalence, serotype distribution and antimicrobial resistance pattern of NTS species among diarrheic patients in 10 primary health centers in Addis Ababa. In addition, patients with gastrointestinal complaints who submitted stool samples to Tikur Anbessa Specialized Hospital (TASH) for bacterial culturing, diagnosis of gastrointestinal parasites and detection of <em xmlns="" class="EmphasisTypeItalic">Helicobacter pylori</em> antigen were also included in the study. TASH is national referral hospital giving services mainly to patients from all sub-cities in Addis Ababa and those from outside Addis Ababa. Various patient related variables such as consumption of raw meat, milk and vegetables; patients demographic data; stool consistency; and the occurrence of other pathogens were recorded to analyze for possible association with <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> isolation.
                  </p>
                </div>
              </section>
              <section xmlns="" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:meta="http://www.springer.com/app/meta" id="Sec2" class="Section1 RenderAsSection1">
                <h2 class="Heading js-ToggleCollapseSection">Methods</h2>
                <div class="js-CollapseSection">
                  <section id="Sec3" class="Section2 RenderAsSection2">
                    <h3 class="Heading">Study design and area</h3>
                    <p xmlns="http://www.w3.org/1999/xhtml" id="Par17" class="Para">A cross-sectional study was conducted in Addis Ababa, Ethiopia, from May 2013 to January 2014. Addis Ababa is organized under 10 sub-cities and there are 36 government-owned primary health centers in the city. Ten representative government-owned health centers were randomly selected, one from each sub-city. In addition, patients with various gastrointestinal complaints at TASH were also included.</p>
                  </section>
                  <section id="Sec4" class="Section2 RenderAsSection2">
                    <h3 class="Heading">Sample size determination and study subjects</h3>
                    <p xmlns="http://www.w3.org/1999/xhtml" id="Par18" class="Para">
                      Sample size (<em xmlns="" class="EmphasisTypeItalic">n =</em> 576) was calculated based on the previous baseline study in Addis Ababa, with a prevalence of 6.4&nbsp;% [<span class="CitationRef">
                        <a href="#CR25">25</a>
                      </span>] using the formula (Z0/2)/∆)2p(1-p) at 95&nbsp;% CI, margin of error of 2&nbsp;%. However, to increase the number of isolates, a total of 765 patients from health centers were included. From each health center, a minimum of 71 and a maximum of 82 diarrheic patients of any age referred for laboratory diagnosis based on stool examination were recruited (<em xmlns="" class="EmphasisTypeItalic">n =</em> 765). Diarrhea was defined as the passage of three or more loose or liquid stools per day [<span class="CitationRef">
                        <a href="#CR27">27</a>
                      </span>]. In addition, 192 patients who presented with various gastrointestinal complaints (diarrhea, abdominal pain and gastritis) and submitted stool samples to the parasitology and microbiology laboratory at TASH were also included. Only 98 (51&nbsp;%) of the 192 stool samples from TASH were diarrheic.
                    </p>
                  </section>
                  <section id="Sec5" class="Section2 RenderAsSection2">
                    <h3 class="Heading">Patients’ history, demographic and laboratory data</h3>
                    <p xmlns="http://www.w3.org/1999/xhtml" id="Par19" class="Para">
                      Information on various potential risk factors was collected including patients’ history such as consumption of raw meat, milk and vegetables during the last 2&nbsp;weeks by interviewing the patients during sample collection from health centers. All demographic, clinical and laboratory data obtained from study participants at health facilities such as stool consistency and laboratory examination results of stool specimens for other pathogens were recorded. The stool consistency was determined in the health center and hospital laboratories immediately after samples were received according to the Bristol stool consistency scale (type 5, 6 and 7) defined as loose, mucoid and watery, respectively [<span class="CitationRef">
                        <a href="#CR28">28</a>
                      </span>]. Analysis for association of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> infection status and various risk factors was conducted only for patients from health centers.
                    </p>
                  </section>
                  <section id="Sec6" class="Section2 RenderAsSection2">
                    <h3 class="Heading">Sample collection, handling and transportation</h3>
                    <p xmlns="http://www.w3.org/1999/xhtml" id="Par20" class="Para">
                      Stool samples were collected from each study participants in clean screw capped plastic containers and transported to the microbiology laboratory of Aklilu Lemma Institute of Pathobiology (ALIPB) in ice box within 3–4&nbsp;h of collection for culture and identification of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> species. Sampling was first conducted from the 10 health centers sequentially and finally from TASH.
                    </p>
                  </section>
                  <section id="Sec7" class="Section2 RenderAsSection2">
                    <h3 class="Heading">Microscopic examination of stool specimens</h3>
                    <p xmlns="http://www.w3.org/1999/xhtml" id="Par21" class="Para">Direct microscopic stool examination was performed for detection of ova and parasites by laboratory technicians in health centers and hospital laboratories where the samples were collected immediately prior to transportation to ALIPB and the laboratory result was recorded.</p>
                  </section>
                  <section id="Sec8" class="Section2 RenderAsSection2">
                    <h3 class="Heading">
                      Culture and identification of <em class="EmphasisTypeItalic">Salmonella</em> species
                    </h3>
                    <p xmlns="http://www.w3.org/1999/xhtml" id="Par22" class="Para">
                      Isolation and identification of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> species was conducted according to World Health Organization (WHO) Global Foodborne Infections Network laboratory protocol [<span class="CitationRef">
                        <a href="#CR29">29</a>
                      </span>]. Briefly, 5&nbsp;g of feces was suspended in 45&nbsp;ml of buffered peptone water and incubated for 24&nbsp;h at 37&nbsp;°C. One hundred μl of this suspension was transferred to 10&nbsp;ml of Rappaport-Vassiliadis enrichment Broth (RVB), (Oxoid, USA) and incubated for 24&nbsp;h at 37&nbsp;°C. One ml of suspension was also transferred to 10&nbsp;ml of Tetrathionate broth (Oxoid, USA) and incubated for 24&nbsp;h at 42&nbsp;°C. The sample from these two broths was streaked on to Xylose Lysine tergitol 4 (XLT-4) selective media and the plates were incubated at 37&nbsp;°C for 24&nbsp;h. Presumptive <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> colonies were then further investigated biochemically using Triple Sugar Iron (TSI) agar, Urea, Citrate and Lysine Iron Agar (LIA) slants. Those colonies with typical <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> biochemical properties were then further confirmed by genus specific PCR [<span class="CitationRef">
                        <a href="#CR30">30</a>
                      </span>]. <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> recovered from both RVB and TTB of a single patient were first considered as different strains until the isolates were tested for antimicrobial susceptibility. When differences in antimicrobial susceptibility were observed, both isolates were considered as different strains. On the other hand, if the isolates showed similar susceptibility pattern, only one isolate was considered for further analysis.
                    </p>
                  </section>
                  <section id="Sec9" class="Section2 RenderAsSection2">
                    <h3 class="Heading">
                      <em class="EmphasisTypeItalic">Salmonella</em> serotyping and phage typing
                    </h3>
                    <p xmlns="http://www.w3.org/1999/xhtml" id="Par23" class="Para">
                      <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> isolates were serotyped and phage-typed at the Public Health Agency of Canada, World Organization for Animal Health (OIÉ) Reference Laboratory for Salmonellosis, Guelph, Ontario, Canada. Briefly, the somatic (O) antigens were determined by slide agglutination tests [<span class="CitationRef">
                        <a href="#CR31">31</a>
                      </span>] and flagellar antigens were determined using a microplate agglutination technique [<span class="CitationRef">
                        <a href="#CR32">32</a>
                      </span>]. The antigenic formulae of Grimont [<span class="CitationRef">
                        <a href="#CR33">33</a>
                      </span>] were used to identify and assign the serotypes of the isolates. Phage typing of <em xmlns="" class="EmphasisTypeItalic">S.</em>Typhimurium isolates was performed by the methods developed by Callow [<span class="CitationRef">
                        <a href="#CR34">34</a>
                      </span>] and extended by Anderson et al. [<span class="CitationRef">
                        <a href="#CR35">35</a>
                      </span>] with reference phages obtained from the Public Health England, Gastrointestinal Bacteria Reference Unit, Colindale, England and the Public Health Agency of Canada, National Laboratory for Enteric Pathogens, Winnipeg, Canada. <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> isolates that reacted with the phages but did not conform to any recognized phage type were designated atypical (AT).
                    </p>
                  </section>
                  <section id="Sec10" class="Section2 RenderAsSection2">
                    <h3 class="Heading">Antimicrobial susceptibility testing</h3>
                    <p xmlns="http://www.w3.org/1999/xhtml" id="Par24" class="Para">
                      Susceptibility of the isolates to a panel of 18 antimicrobials was determined using the Kirby-Bauer disk diffusion method according to the guidelines of the Clinical and Laboratory Standards Institute [<span class="CitationRef">
                        <a href="#CR36">36</a>
                      </span>]. The following antimicrobials (Sensi-Discs, Becton, Dickinson and Company, Loveton, USA) and disc potencies (μg) were used: amikacin (30), amoxicillin + clavulanic acid (20/10), ampicillin (10), cefoxitin (30), ceftriaxone (30), cephalothin (30), chloramphenicol (30), ciprofloxacin (5), gentamicin (10), kanamycin (30), nalidixic acid (30), neomycin (30), nitrofurantoin (100), streptomycin (10), sulfisoxazole (1000), sulfamethoxazole + trimethoprim (23.75/1.25), trimethoprim (5) and tetracycline (30). The interpretation of the categories of susceptible, intermediate or resistant was based on the CLSI guidelines [<span class="CitationRef">
                        <a href="#CR36">36</a>
                      </span>] and for the purpose of analysis, all readings classified as intermediate were considered as resistant where necessary. Reference strain of <em xmlns="" class="EmphasisTypeItalic">Escherichia coli</em> ATCC 25922 was used as a quality control.
                    </p>
                  </section>
                  <section id="Sec11" class="Section2 RenderAsSection2">
                    <h3 class="Heading">Ethical consideration</h3>
                    <p xmlns="http://www.w3.org/1999/xhtml" id="Par25" class="Para">The study protocol was ethically approved by the Institutional Review Board of College of Health Sciences, Addis Ababa University and National Research Ethics Review Committee (Permit#3-10/474/05 dated 29–03–2015). Individual oral informed consent was obtained from all adult participants and the parents or guardians of all children participated in the study.</p>
                  </section>
                  <section id="Sec12" class="Section2 RenderAsSection2">
                    <h3 class="Heading">Statistical analysis</h3>
                    <p xmlns="http://www.w3.org/1999/xhtml" id="Par26" class="Para">
                      Data was analyzed using STATA software version 11. Prevalence of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> was calculated as a percentage of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> culture-positive stool samples among the total number of samples examined. Associations of putative risk factors as well as occurrence of protozoan pathogens with <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> infection in patients from health centers were assessed using both univariable and multivariable logistic regression, accounting for clustering of patients at the health center level by using cluster-robust standard errors. The variables used in multivariable logistic regression were sex, age, consumption of raw (meat, milk, vegetables), stool consistency, vomiting, and infection status with <em xmlns="" class="EmphasisTypeItalic">Entamoeba histolytica</em> and <em xmlns="" class="EmphasisTypeItalic">Giardia lamblia.</em> Results were reported statistically significant whenever the <em xmlns="" class="EmphasisTypeItalic">p</em>-value was less than 5&nbsp;%.
                    </p>
                  </section>
                </div>
              </section>
              <section xmlns="" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:meta="http://www.springer.com/app/meta" id="Sec13" class="Section1 RenderAsSection1">
                <h2 class="Heading js-ToggleCollapseSection">Results</h2>
                <div class="js-CollapseSection">
                  <section id="Sec14" class="Section2 RenderAsSection2">
                    <h3 class="Heading">
                      <em class="EmphasisTypeItalic">Salmonella</em> prevalence and association with patient feeding habits and other factors
                    </h3>
                    <div xmlns="http://www.w3.org/1999/xhtml" id="Par27" class="Para">
                      All <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> isolates recovered from a single patient from both RVB and TTB, though in some cases (11.9&nbsp;%), differed in antimicrobial resistance pattern; they all belonged to a single serotype. Therefore, only a single serotype per patient was considered for risk factor analysis and serotype distribution analysis, while all isolates (<em xmlns="" class="EmphasisTypeItalic">n =</em> 67) were considered for antimicrobial resistance analysis. Seven hundred and sixty-five diarrheic patients from health centers (329 male and 436 female) and 192 patients (101 male and 89 female) from TASH were included in the study. Fifty-five (7.2&nbsp;%) and 4 (2.1&nbsp;%) patients from health centers and TASH were culture positive for <em xmlns="" class="EmphasisTypeItalic">Salmonella</em>, respectively. The overall prevalence of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> in the current study was 6.2&nbsp;%. There was no difference in prevalence of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> between male and female patients as well as among different age groups (Tables&nbsp;<span class="InternalRef">
                        <a href="#Tab1">1</a>
                      </span> and <span class="InternalRef">
                        <a href="#Tab2">2</a>
                      </span>). Among eating habits of patients, 10.8&nbsp;% of those consuming raw vegetables were <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> culture positive, whereas only 6.1&nbsp;% of patients with no habit of eating raw vegetables were positive for <em xmlns="" class="EmphasisTypeItalic">Salmonella.</em> Multivariable logistic regression analysis after adjusting for all pre-specified variables revealed statistically significant association of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> infection status with consumption of raw vegetables (OR = 1.91, 95&nbsp;% CI = 1.29–2.83, χ<sup>2</sup> = 4.74, <em xmlns="" class="EmphasisTypeItalic">p =</em> 0.025) (Table&nbsp;<span class="InternalRef">
                        <a href="#Tab2">2</a>
                      </span>).
                      <figure xmlns="" id="Tab1" class="FigureTable">
                        <figcaption class="Caption" lang="en">
                          <div xmlns="http://www.w3.org/1999/xhtml" class="CaptionContent">
                            <span class="CaptionNumber">Table 1</span>
                            <p xmlns="" class="SimplePara">
                              Frequency of <em class="EmphasisTypeItalic">Salmonella</em> infection among diarrheic out-patients attending health centers in Addis Ababa with respect to selected factors
                            </p>
                          </div>
                        </figcaption>
                        <div class="Table">
                          <table xmlns="http://www.w3.org/1999/xhtml" border="1">
                            <colgroup>
                              <col align="char" char="."></col>
                              <col align="char" char="."></col>
                              <col align="char" char="."></col>
                              <col align="char" char="."></col>
                            </colgroup>
                            <thead>
                              <tr class="header">
                                <th align="char" char=".">
                                  <p xmlns="" class="SimplePara">Factor</p>
                                </th>
                                <th align="char" char=".">
                                  <p xmlns="" class="SimplePara">Total</p>
                                </th>
                                <th align="char" char=".">
                                  <p xmlns="" class="SimplePara">
                                    No (%) <em class="EmphasisTypeItalic">Salmonella</em> positive
                                  </p>
                                </th>
                                <th align="char" char=".">
                                  <p xmlns="" class="SimplePara">
                                    <em class="EmphasisTypeItalic">P</em>-value
                                  </p>
                                </th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">Sex</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Male</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">329</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">24(7.3)</p>
                                </td>
                                <td rowspan="2" align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.92</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Female</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">436</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">31(7.1)</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">Consumption of raw meat</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> No</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">622</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">44(7.1)</p>
                                </td>
                                <td rowspan="2" align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.80</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Yes</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">143</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">11(7.7)</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">Consumption of raw milk</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> No</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">720</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">51(7.1)</p>
                                </td>
                                <td rowspan="2" align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.19</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Yes</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">45</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">4(8.9)</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">Consumption of raw vegetables</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> No</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">571</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">34(6.0)</p>
                                </td>
                                <td rowspan="2" align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.025</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Yes</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">194</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">21(10.8)</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">Vomiting</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> No</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">714</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">51(7.1)</p>
                                </td>
                                <td rowspan="2" align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.85</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Yes</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">51</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">4(7.8)</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">Age</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> 0–5&nbsp;years</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">160</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">10(6.3)</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> 6–18&nbsp;years</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">171</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">12(7.0)</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.77</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> 19–45</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">359</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">27(7.5)</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> &gt;45</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">75</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">6(8)</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">Stool consistency</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Mucoid</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">283</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">10(3.5)</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Loose</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">117</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">9(7.7)</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.005</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Watery</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">365</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">36(9.9)</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">
                                    <em class="EmphasisTypeItalic">Entamoeba histolytica</em> infection
                                  </p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Positive</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">145</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">14(9.7)</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.058</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Negative</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">620</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">41(6.6)</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">
                                    <em class="EmphasisTypeItalic">Giardia lamblia</em> infection
                                  </p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Positive</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">62</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">3(4.8)</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.46</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Negative</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">703</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">52(7.4)</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                      </figure>
                      <figure xmlns="" id="Tab2" class="FigureTable">
                        <figcaption class="Caption" lang="en">
                          <div xmlns="http://www.w3.org/1999/xhtml" class="CaptionContent">
                            <span class="CaptionNumber">Table 2</span>
                            <p xmlns="" class="SimplePara">
                              Association of selected risk factors with <em class="EmphasisTypeItalic">Salmonella</em> infection in diarrheic out-patients in Addis Ababa health centers
                            </p>
                          </div>
                        </figcaption>
                        <div class="Table">
                          <table xmlns="http://www.w3.org/1999/xhtml" border="1">
                            <colgroup>
                              <col align="char" char="."></col>
                              <col align="char" char="."></col>
                              <col align="char" char="."></col>
                              <col align="char" char="."></col>
                              <col align="char" char="."></col>
                            </colgroup>
                            <thead>
                              <tr class="header">
                                <th align="char" char=".">
                                  <p xmlns="" class="SimplePara">Variable</p>
                                </th>
                                <th colspan="2" align="char" char=".">
                                  <p xmlns="" class="SimplePara">Crude odds Ratio and 95&nbsp;% confidence interval</p>
                                </th>
                                <th colspan="2" align="char" char=".">
                                  <p xmlns="" class="SimplePara">Adjusted odds Ratio and 95&nbsp;% confidence interval</p>
                                </th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">Sex</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Male</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">1.03</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.61–1.74</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">1.02</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.57–1.85</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Female</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">Consumption of raw meat</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> No</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">1.1</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.58–2.08</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.86</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.55–1.36</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Yes</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">Consumption of raw milk</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> No</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">1.28</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.53–3.01</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">1.29</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.51–3.26</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Yes</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">Consumption of raw vegetable</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> No</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">1.92</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">1.36–2.70</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">1.91</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">1.29–2.83</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Yes</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">Vomiting</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> No</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">1.11</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.37–3.32</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.93</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.34–2.52</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Yes</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">Age</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> 0–5&nbsp;years</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> 6–18&nbsp;years</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">1.14</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.41–3.13</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">1.03</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.38–2.81</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> 19–45</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">1.22</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.53–2.81</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">1.02</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.44–2.35</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> &gt;45</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">1.32</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.32–5.57</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">1.27</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.33–4.93</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">Stool consistency</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Mucoid</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Loose</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">2.28</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.90–5.76</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">2.33</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.91–5.97</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Watery</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">2.99</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">1.23–7.27</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">3.05</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">1.22–7.60</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">
                                    <em class="EmphasisTypeItalic">Entamoeba histolytica</em> infection
                                  </p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Positive</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">1.85</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.84–4.08</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">1.77</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.85–3.67</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Negative</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">
                                    <em class="EmphasisTypeItalic">Giardia lamblia</em> infection
                                  </p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Positive</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.64</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.25–1.60</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.64</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0.26–1.56</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara"> Negative</p>
                                </td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                                <td align="char" char=".">&nbsp;</td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                      </figure>
                    </div>
                    <div xmlns="http://www.w3.org/1999/xhtml" id="Par28" class="Para">
                      Although there was variability in the detection rate of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> from patients attending different health centers, the difference was not statistically significant (<em xmlns="" class="EmphasisTypeItalic">p =</em> 0.29) (Fig. <span class="InternalRef">
                        <a href="#Fig1">1</a>
                      </span>). Having watery diarrhea (9.8&nbsp;%) was significantly associated with <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> recovery compared to mucoid (7.7&nbsp;%) and loose stool (3.5&nbsp;%) using multivariable logistic regression analysis after adjusting for the other variables (OR = 3.3, 95&nbsp;% CI = 1.23–8.88, χ<sup>2</sup> = 10.54, <em xmlns="" class="EmphasisTypeItalic">p =</em> 0.005). Comparison of patients with symptoms of vomiting to those with no vomiting revealed no significant difference in <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> culture-positivity (Tables&nbsp;<span class="InternalRef">
                        <a href="#Tab1">1</a>
                      </span> and <span class="InternalRef">
                        <a href="#Tab2">2</a>
                      </span>).
                      <figure xmlns="" class="Figure" id="Fig1">
                        <div xmlns="http://www.w3.org/1999/xhtml" class="MediaObject" id="MO1">
                          <img src="https://static-content.springer.com/image/art%3A10.1186%2Fs12879-015-1235-y/MediaObjects/12879_2015_1235_Fig1_HTML.gif" alt="https://static-content.springer.com/image/art%3A10.1186%2Fs12879-015-1235-y/MediaObjects/12879_2015_1235_Fig1_HTML.gif"></img>
                        </div>
                        <figcaption class="Caption" lang="en">
                          <div xmlns="http://www.w3.org/1999/xhtml" class="CaptionContent">
                            <span class="CaptionNumber">Fig. 1</span>
                            <p xmlns="" class="SimplePara">
                              Prevalence of <em class="EmphasisTypeItalic">Salmonella</em> among out-patients attending primary health centers in Addis Ababa
                            </p>
                          </div>
                        </figcaption>
                      </figure>
                    </div>
                  </section>
                  <section id="Sec15" class="Section2 RenderAsSection2">
                    <h3 class="Heading">
                      Prevalence of ova and parasites and concomitant infection with <em class="EmphasisTypeItalic">Salmonella</em>
                    </h3>
                    <div xmlns="http://www.w3.org/1999/xhtml" id="Par29" class="Para">
                      The most common pathogens detected were <em xmlns="" class="EmphasisTypeItalic">Entamoeba histolytica</em> (19&nbsp;%), <em xmlns="" class="EmphasisTypeItalic">Giardia lamblia</em> (8.1&nbsp;%), egg of <em xmlns="" class="EmphasisTypeItalic">Hymenolepis nanna</em> (0.9&nbsp;%) and egg/larvae of <em xmlns="" class="EmphasisTypeItalic">Strongyloides stercoralis</em> (0.7&nbsp;%) among patients from health centers, whereas only <em xmlns="" class="EmphasisTypeItalic">E. histolytica</em> (0.5&nbsp;%), <em xmlns="" class="EmphasisTypeItalic">G. lambia</em> (4.3&nbsp;%), and egg of <em xmlns="" class="EmphasisTypeItalic">Tanea</em> species (1.1&nbsp;%) were detected in patients from TASH (Table&nbsp;<span class="InternalRef">
                        <a href="#Tab3">3</a>
                      </span>). Although <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> was commonly detected in patients positive for <em xmlns="" class="EmphasisTypeItalic">E. histolytica</em> (9.7&nbsp;%) compared to negative ones (6.6&nbsp;%) <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> infection was not significantly associated with any of the parasites (Table&nbsp;<span class="InternalRef">
                        <a href="#Tab2">2</a>
                      </span>).
                      <figure xmlns="" id="Tab3" class="FigureTable">
                        <figcaption class="Caption" lang="en">
                          <div xmlns="http://www.w3.org/1999/xhtml" class="CaptionContent">
                            <span class="CaptionNumber">Table 3</span>
                            <p xmlns="" class="SimplePara">Common pathogens detected from stool samples of the study participants</p>
                          </div>
                        </figcaption>
                        <div class="Table">
                          <table xmlns="http://www.w3.org/1999/xhtml" border="1">
                            <colgroup>
                              <col align="char" char="."></col>
                              <col align="char" char="."></col>
                              <col align="char" char="."></col>
                              <col align="char" char="."></col>
                              <col align="char" char="."></col>
                            </colgroup>
                            <thead>
                              <tr class="header">
                                <th align="char" char=".">&nbsp;</th>
                                <th colspan="2" align="char" char=".">
                                  <p xmlns="" class="SimplePara">Health Centers</p>
                                </th>
                                <th colspan="2" align="char" char=".">
                                  <p xmlns="" class="SimplePara">TASH</p>
                                </th>
                              </tr>
                              <tr class="header">
                                <th align="char" char=".">
                                  <p xmlns="" class="SimplePara">Pathogen infection status</p>
                                </th>
                                <th align="char" char=".">
                                  <p xmlns="" class="SimplePara">Number examined</p>
                                </th>
                                <th align="char" char=".">
                                  <p xmlns="" class="SimplePara">Number (%) positive</p>
                                </th>
                                <th align="char" char=".">
                                  <p xmlns="" class="SimplePara">
                                    <sup xmlns="http://www.w3.org/1999/xhtml">a</sup>Number examined
                                  </p>
                                </th>
                                <th align="char" char=".">
                                  <p xmlns="" class="SimplePara">Number (%) positive</p>
                                </th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">
                                    <em class="EmphasisTypeItalic">Entamoeba histolytica</em>
                                  </p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">765</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">145(19)</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">188</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">1(0.5)</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">
                                    <em class="EmphasisTypeItalic">Giardia lamblia</em>
                                  </p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">765</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">62(8.1)</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">188</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">8(4.3)</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">
                                    <em class="EmphasisTypeItalic">Hymenolepis nanna</em>
                                  </p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">765</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">7(0.9)</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">188</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0(0)</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">Strongloid worm/eggs</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">765</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">5(0.7)</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">188</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0(0)</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">Hook worm</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">765</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">3(0.4)</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">188</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0(0)</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">Ascaris egg</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">765</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">2(0.3)</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">188</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0(0)</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">Eggs of Tanea</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">765</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">0(0)</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">188</p>
                                </td>
                                <td align="char" char=".">
                                  <p xmlns="" class="SimplePara">2(1.1)</p>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                        <div xmlns="http://www.w3.org/1999/xhtml" class="TableFooter">
                          <p xmlns="" class="SimplePara">
                            <sup xmlns="http://www.w3.org/1999/xhtml">a</sup>Only 188 of 192 samples at TASH were examined for ova and parasites
                          </p>
                        </div>
                      </figure>
                    </div>
                  </section>
                  <section id="Sec16" class="Section2 RenderAsSection2">
                    <h3 class="Heading">
                      <em class="EmphasisTypeItalic">Salmonella</em> Serotype distribution
                    </h3>
                    <div xmlns="http://www.w3.org/1999/xhtml" id="Par30" class="Para">
                      Overall, 11 different serotypes were recovered, of which the majority were <em xmlns="" class="EmphasisTypeItalic">S</em>. Typhimurium (22, 37.3&nbsp;%) followed by <em xmlns="" class="EmphasisTypeItalic">S.</em> Virchow (20, 33.9&nbsp;%) and <em xmlns="" class="EmphasisTypeItalic">S</em>. Kottbus (6, 10.2&nbsp;%). Other serotypes such as <em xmlns="" class="EmphasisTypeItalic">S.</em> Miami (<em xmlns="" class="EmphasisTypeItalic">n =</em> 2), <em xmlns="" class="EmphasisTypeItalic">S.</em> Kentucky (<em xmlns="" class="EmphasisTypeItalic">n =</em> 2), <em xmlns="" class="EmphasisTypeItalic">S.</em> Newport (<em xmlns="" class="EmphasisTypeItalic">n =</em> 2), <em xmlns="" class="EmphasisTypeItalic">S.</em> Enteritidis (<em xmlns="" class="EmphasisTypeItalic">n =</em> 1), <em xmlns="" class="EmphasisTypeItalic">S.</em> Braenderup (<em xmlns="" class="EmphasisTypeItalic">n =</em> 1), <em xmlns="" class="EmphasisTypeItalic">S.</em> Saintpaul (<em xmlns="" class="EmphasisTypeItalic">n =</em> 1), <em xmlns="" class="EmphasisTypeItalic">S.</em> Concord (<em xmlns="" class="EmphasisTypeItalic">n =</em> 1), and <em xmlns="" class="EmphasisTypeItalic">S.</em> V: ROUGH-O; − :- (<em xmlns="" class="EmphasisTypeItalic">n =</em> 1) were also identified (Table&nbsp;<span class="InternalRef">
                        <a href="#Tab4">4</a>
                      </span>).
                      <figure xmlns="" id="Tab4" class="FigureTable">
                        <figcaption class="Caption" lang="en">
                          <div xmlns="http://www.w3.org/1999/xhtml" class="CaptionContent">
                            <span class="CaptionNumber">Table 4</span>
                            <p xmlns="" class="SimplePara">
                              Relative proportion of <em class="EmphasisTypeItalic">Salmonella</em> serotypes isolated from diarrheic patients in Addis Ababa and their resistance profile
                            </p>
                          </div>
                        </figcaption>
                        <div class="Table">
                          <table xmlns="http://www.w3.org/1999/xhtml" border="1">
                            <colgroup>
                              <col align="left"></col>
                              <col align="left"></col>
                              <col align="left"></col>
                              <col align="left"></col>
                              <col align="left"></col>
                              <col align="left"></col>
                              <col align="left"></col>
                              <col align="left"></col>
                              <col align="left"></col>
                              <col align="left"></col>
                              <col align="left"></col>
                              <col align="left"></col>
                              <col align="left"></col>
                              <col align="left"></col>
                              <col align="left"></col>
                              <col align="left"></col>
                              <col align="left"></col>
                              <col align="left"></col>
                              <col align="left"></col>
                              <col align="left"></col>
                            </colgroup>
                            <thead>
                              <tr class="header">
                                <th align="left">
                                  <p xmlns="" class="SimplePara">Serotype</p>
                                </th>
                                <th align="left">
                                  <p xmlns="" class="SimplePara">No.</p>
                                </th>
                                <th align="left">
                                  <p xmlns="" class="SimplePara">An</p>
                                </th>
                                <th align="left">
                                  <p xmlns="" class="SimplePara">Amp</p>
                                </th>
                                <th align="left">
                                  <p xmlns="" class="SimplePara">Amc</p>
                                </th>
                                <th align="left">
                                  <p xmlns="" class="SimplePara">C</p>
                                </th>
                                <th align="left">
                                  <p xmlns="" class="SimplePara">Cro</p>
                                </th>
                                <th align="left">
                                  <p xmlns="" class="SimplePara">Cf</p>
                                </th>
                                <th align="left">
                                  <p xmlns="" class="SimplePara">Cip</p>
                                </th>
                                <th align="left">
                                  <p xmlns="" class="SimplePara">Fox</p>
                                </th>
                                <th align="left">
                                  <p xmlns="" class="SimplePara">Gm</p>
                                </th>
                                <th align="left">
                                  <p xmlns="" class="SimplePara">K</p>
                                </th>
                                <th align="left">
                                  <p xmlns="" class="SimplePara">Sxt</p>
                                </th>
                                <th align="left">
                                  <p xmlns="" class="SimplePara">Tmp</p>
                                </th>
                                <th align="left">
                                  <p xmlns="" class="SimplePara">Te</p>
                                </th>
                                <th align="left">
                                  <p xmlns="" class="SimplePara">Su</p>
                                </th>
                                <th align="left">
                                  <p xmlns="" class="SimplePara">S</p>
                                </th>
                                <th align="left">
                                  <p xmlns="" class="SimplePara">Nitro</p>
                                </th>
                                <th align="left">
                                  <p xmlns="" class="SimplePara">Na</p>
                                </th>
                                <th align="left">
                                  <p xmlns="" class="SimplePara">N</p>
                                </th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr class="noclass">
                                <td align="left">
                                  <p xmlns="" class="SimplePara">Braenderup</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="left">
                                  <p xmlns="" class="SimplePara">Concord</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="left">
                                  <p xmlns="" class="SimplePara">Enteritidis</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="left">
                                  <p xmlns="" class="SimplePara">Kentucky</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">2</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">2</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">2</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">2</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">2</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">2</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">2</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">2</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">2</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">2</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">2</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="left">
                                  <p xmlns="" class="SimplePara">Kottbus</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">7</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">3</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">4</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">7</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">2</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">2</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="left">
                                  <p xmlns="" class="SimplePara">Miami</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">3</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">3</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">2</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="left">
                                  <p xmlns="" class="SimplePara">Newport</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">2</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="left">
                                  <p xmlns="" class="SimplePara">Sainpaul</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="left">
                                  <p xmlns="" class="SimplePara">Typhimurium</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">27</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">6</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">4</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">6</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">6</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">3</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">13</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">18</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">9</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="left">
                                  <p xmlns="" class="SimplePara">V:ROUGH-O;-:-</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="left">
                                  <p xmlns="" class="SimplePara">Virchow</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">21</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">1</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">6</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">3</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">4</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">14</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">11</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">10</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">3</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="left">
                                  <p xmlns="" class="SimplePara">Total</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">67</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">11</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">8</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">2</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">2</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">12</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">3</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">2</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">5</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">23</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">3</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">3</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">9</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">26</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">50</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">27</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">16</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">9</p>
                                </td>
                              </tr>
                              <tr class="noclass">
                                <td align="left">
                                  <p xmlns="" class="SimplePara">(%)</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">100</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">0</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">16.4</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">11.9</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">3</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">3</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">17.9</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">4.5</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">3</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">7.5</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">34.3</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">4.5</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">4.5</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">13.4</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">38.9</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">74.6</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">40.3</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">23.9</p>
                                </td>
                                <td align="left">
                                  <p xmlns="" class="SimplePara">13.4</p>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                        <div xmlns="http://www.w3.org/1999/xhtml" class="TableFooter">
                          <p xmlns="" class="SimplePara">
                            <em class="EmphasisTypeItalic">An</em> amikacin, <em class="EmphasisTypeItalic">Amp</em> ampicillin, <em class="EmphasisTypeItalic">Amc</em> amoxicillin and clavulanic acid, <em class="EmphasisTypeItalic">Cf</em> cephalothin, <em class="EmphasisTypeItalic">C</em>, chloramphenicol, <em class="EmphasisTypeItalic">Cro</em> ceftriaxone, <em class="EmphasisTypeItalic">Cip</em> ciprofloxacin, <em class="EmphasisTypeItalic">Gm</em> gentamicin, <em class="EmphasisTypeItalic">K</em> kanamycin, <em class="EmphasisTypeItalic">Tmp</em> trimethoprim, <em class="EmphasisTypeItalic">Sxt</em> sulfamethoxazole + trimethoprim, <em class="EmphasisTypeItalic">Te</em> tetracycline, <em class="EmphasisTypeItalic">Su</em>-sulfisoxazole, <em class="EmphasisTypeItalic">Nitro</em> nitrofurantoin, <em class="EmphasisTypeItalic">Na</em>- nalidixic acid, <em class="EmphasisTypeItalic">N</em> neomycin
                          </p>
                        </div>
                      </figure>
                    </div>
                  </section>
                  <section id="Sec17" class="Section2 RenderAsSection2">
                    <h3 class="Heading">Antimicrobial Susceptibility</h3>
                    <p xmlns="http://www.w3.org/1999/xhtml" id="Par31" class="Para">
                      At least one isolate was resistant to all tested antimicrobial agents except amikacin to which all isolates were susceptible. Fifty (74.6&nbsp;%), 27 (40.3&nbsp;%), 26 (38.8&nbsp;%), 23 (34.3&nbsp;%), 12 (17.9&nbsp;%), and 11 (16.4&nbsp;%) of the isolates were resistant to streptomycin, nitrofurantoin, sulfisoxazole, kanamycin, cefalothin, and ampicillin, respectively (Table&nbsp;<span class="InternalRef">
                        <a href="#Tab4">4</a>
                      </span>). Nine (13.4&nbsp;%) of the isolates were pan-susceptible to 18 antimicrobials tested. Six of these isolates were <em xmlns="" class="EmphasisTypeItalic">S</em>. Typhimurium, while the remaining 3 were <em xmlns="" class="EmphasisTypeItalic">S.</em> Virchow. Resistance to 2 or more antimicrobials was recorded in 64.2&nbsp;% of the isolates, while resistance to 3 or more antimicrobials was detected in 40.3&nbsp;% of the total isolates. MDR to 5 or more antimicrobials was detected in 17 (25.4&nbsp;%) of the isolates. Two strains of <em xmlns="" class="EmphasisTypeItalic">S</em>. Kentucky isolated from patients in two different health centers were resistant to 11 antimicrobials. Likewise, one <em xmlns="" class="EmphasisTypeItalic">S</em>. Typhimurium phagetype 193 and one <em xmlns="" class="EmphasisTypeItalic">S.</em> Concord recovered from two diarrheic children at TASH were resistant to 12 and 13 antimicrobials tested, respectively. In general, 36 different resistance patterns (R-Pattern) were detected among the 67 isolates examined which is an indication of phenotypic diversity of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> strains circulating in the study area. The dominant R-pattern was resistance to a single antimicrobial agent: streptomycin (<em xmlns="" class="EmphasisTypeItalic">n =</em> 11) followed by resistance to both streptomycin and nitrofurantoin (6 isolates) (Additional file <span class="InternalRef">
                        <a href="#MOESM1">1</a>
                      </span>: Table S1).
                    </p>
                  </section>
                  <section id="Sec18" class="Section2 RenderAsSection2">
                    <h3 class="Heading">Association between serotype and antimicrobial resistance</h3>
                    <p xmlns="http://www.w3.org/1999/xhtml" id="Par32" class="Para">
                      Different serotypes appeared to exhibit differential resistance to some of the antimicrobials tested. For instance, resistance to ampicillin was noted in strains belonging to <em xmlns="" class="EmphasisTypeItalic">S.</em> Concord, <em xmlns="" class="EmphasisTypeItalic">S.</em> Kentucky, <em xmlns="" class="EmphasisTypeItalic">S.</em> Typhimurium, <em xmlns="" class="EmphasisTypeItalic">S.</em> V: ROUGH-O;-: and <em xmlns="" class="EmphasisTypeItalic">S.</em> Virchow; while <em xmlns="" class="EmphasisTypeItalic">S.</em> Kentucky and <em xmlns="" class="EmphasisTypeItalic">S</em>. Kottbus were the only serotypes resistant to ciprofloxacin. In other cases, resistance to streptomycin was common among the serotypes (Table&nbsp;<span class="InternalRef">
                        <a href="#Tab4">4</a>
                      </span>).
                    </p>
                  </section>
                </div>
              </section>
              <section xmlns="" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:meta="http://www.springer.com/app/meta" id="Sec19" class="Section1 RenderAsSection1">
                <h2 class="Heading js-ToggleCollapseSection">Discussion</h2>
                <div class="js-CollapseSection">
                  <p xmlns="http://www.w3.org/1999/xhtml" id="Par33" class="Para">
                    In the current study, 7.2&nbsp;% of patients from the health centers and 2.1&nbsp;% from TASH were culture positive for <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> species. The possible explanation for low prevalence of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> in patients at TASH could be due to health center treated patient referral to this hospital or because not all of the stool samples collected at TASH were from diarrheic patients. The observed heterogeneity of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> infection across health centers goes with the known hygienic levels of residential areas served by these health centers. Addis Ketema and Arada health centers are located at the center of the old Addis Ababa with larger human population and lots of slum areas with poor hygiene compared to Kolfe Keranyo and Gulele health centers, which are located at periphery of the city with relatively better hygienic condition.
                  </p>
                  <p xmlns="http://www.w3.org/1999/xhtml" id="Par34" class="Para">
                    The overall prevalence of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> (6.2&nbsp;%) in the current study is in agreement with previous studies in Addis Ababa (5.3&nbsp;%) [<span class="CitationRef">
                      <a href="#CR20">20</a>
                    </span>] and Jimma hospitals (6.2&nbsp;%) [<span class="CitationRef">
                      <a href="#CR37">37</a>
                    </span>] in pediatric patients. Previous studies in Addis Ababa in adult diarrheic out-patients showed a prevalence of 4.5&nbsp;% [<span class="CitationRef">
                      <a href="#CR24">24</a>
                    </span>] and 6.4&nbsp;% [<span class="CitationRef">
                      <a href="#CR25">25</a>
                    </span>]. Systematic review and meta-analysis of published works in Ethiopia over the period of 38&nbsp;years has also shown a prevalence of 8.7&nbsp;% in diarrheic children and 5.7&nbsp;% in diarrheic adults [<span class="CitationRef">
                      <a href="#CR38">38</a>
                    </span>].
                  </p>
                  <p xmlns="http://www.w3.org/1999/xhtml" id="Par35" class="Para">
                    <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> detection was more common in patients who consume raw vegetables. This suggests that raw vegetables could be one of the major vehicles for <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> infection in Addis Ababa. The common vegetables consumed by these patients were lettuce, tomatoes and green peppers. An accumulating body of evidence indicates that vegetables sold in markets could possibly be contaminated with <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> species<em xmlns="" class="EmphasisTypeItalic">.</em> Indeed, studies conducted in Addis Ababa [<span class="CitationRef">
                      <a href="#CR39">39</a>
                    </span>], Jimma (South–west Ethiopia) [<span class="CitationRef">
                      <a href="#CR40">40</a>
                    </span>] and Mexico [<span class="CitationRef">
                      <a href="#CR41">41</a>
                    </span>] showed that an appreciable percentage of vegetables sold in the respective markets are contaminated with <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> species<em xmlns="" class="EmphasisTypeItalic">.</em> The use of fecally contaminated water for irrigation and washing of fresh produces can serve as a source of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> contamination for raw vegetables in addition to cross-contamination in the kitchen [<span class="CitationRef">
                      <a href="#CR42">42</a>
                    </span>]. More recently, <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> has been shown to colonize and be internalized into tomato during pre–and post–harvesting stages [<span class="CitationRef">
                      <a href="#CR43">43</a>
                    </span>]. Special attention should, therefore, be paid to reducing the risk of infection of the public with <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> from raw vegetables. Appropriate pre–and post–harvest strategies of reducing contamination of vegetables by <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> and other enteric pathogens should be implemented.
                  </p>
                  <p xmlns="http://www.w3.org/1999/xhtml" id="Par36" class="Para">
                    The dominant pathogens other than <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> detected in the current study were <em xmlns="" class="EmphasisTypeItalic">E. histolytica</em> followed by <em xmlns="" class="EmphasisTypeItalic">G. lamblia.</em> However, no significant association of co-occurrence of parasites with <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> infection was detected.
                  </p>
                  <p xmlns="http://www.w3.org/1999/xhtml" id="Par37" class="Para">
                    <em xmlns="" class="EmphasisTypeItalic">S</em>. Typhimurium followed by <em xmlns="" class="EmphasisTypeItalic">S.</em> Virchow and <em xmlns="" class="EmphasisTypeItalic">S.</em> Kottubus were the dominant serotypes in the current study unlike the reports by Beyene et al. [<span class="CitationRef">
                      <a href="#CR20">20</a>
                    </span>] and Gebre-Yohannes et al. [<span class="CitationRef">
                      <a href="#CR44">44</a>
                    </span>] where the dominant serotypes among NTS isolates were <em xmlns="" class="EmphasisTypeItalic">S.</em> Concord followed by <em xmlns="" class="EmphasisTypeItalic">S.</em> Typhimurium. In the present study, only one <em xmlns="" class="EmphasisTypeItalic">S.</em> Concord was isolated from a one year old child at TASH. The difference between the studies could be attributed to differences in patient demography, season and place of collection. Furthermore, differences in dynamics of the sources of infection might have contributed to dominance of different serotypes in the respective studies. A previous study has shown that the epidemiology of NTS is characterized by the temporal dominance of certain successful clones followed by a decline and replacement with another clone [<span class="CitationRef">
                      <a href="#CR45">45</a>
                    </span>]. The dominance of <em xmlns="" class="EmphasisTypeItalic">S.</em> Typhimurium in the current study is in agreement with studies conducted in other sub-Saharan African countries including Kenya [<span class="CitationRef">
                      <a href="#CR46">46</a>
                    </span>] and Congo [<span class="CitationRef">
                      <a href="#CR47">47</a>
                    </span>].
                  </p>
                  <p xmlns="http://www.w3.org/1999/xhtml" id="Par38" class="Para">
                    Overall, rate of antimicrobial resistance is low in the current study compared to previous investigations. For instance Beyene et al. [<span class="CitationRef">
                      <a href="#CR20">20</a>
                    </span>] reported 82.3&nbsp;% resistance to ampicillin and 78.2&nbsp;% to ceftriaxone, which is much higher than the current finding of 16.4&nbsp;% and 3&nbsp;%, respectively. Only 3&nbsp;%, 7.5&nbsp;%, 13.4&nbsp;%, and 4.5&nbsp;% of the isolates were resistant to chloramphenicol, gentamicin, tetracycline, and sulfamethoxazole + trimethoprim, respectively in the current study, while 81.4&nbsp;%, 74.3&nbsp;%, 39.8&nbsp;% and 80.5&nbsp;% of the isolates were resistant to the corresponding antibiotics, respectively, in the previously mentioned study. A separate study reported 59.7&nbsp;%, 32.3&nbsp;%, 61.7&nbsp;%, 29&nbsp;%, and 51.6&nbsp;% resistance to ampicillin, cephalothin, chloramphenicol, tetracycline and Sxt, respectively in NTS isolates recovered from hospitalized patients at TASH in Addis Ababa [<span class="CitationRef">
                      <a href="#CR48">48</a>
                    </span>]. The reason behind this discrepancy could be differences in serotype composition reported by the studies. As mentioned, the dominant serotype in the study by Beyene <em xmlns="" class="EmphasisTypeItalic">et al.</em> [<span class="CitationRef">
                      <a href="#CR20">20</a>
                    </span>] was <em xmlns="" class="EmphasisTypeItalic">S</em>. Concord. However, only one isolate of this serotype was recovered in the current study. Though <em xmlns="" class="EmphasisTypeItalic">S.</em> Concord was resistant to many antimicrobials in both studies, its rarity in the present study might have contributed to the relatively low levels of overall antimicrobial resistance that was observed. Furthermore, the previous studies were conducted in referral hospitals, where patients are admitted after being treated in health centers with various antimicrobials. Thus, patients could have been infected by clonal epidemic MDR strains of <em xmlns="" class="EmphasisTypeItalic">S.</em> Concord or other serotypes. Some of the infections in the previous reports also might have been acquired from hospitals by MDR strains. Majority of the isolates in the current study were, however, collected from patients at primary health centers, with minimized prior exposure to antimicrobials. The fact that 2 of the 4 isolates from TSRH in the current study were resistant to 11 and 13 antimicrobials supports this assertion. Similar decrease in prevalence of resistance in NTS in rural district hospital has also been reported from Kenya [<span class="CitationRef">
                      <a href="#CR49">49</a>
                    </span>].
                  </p>
                  <p xmlns="http://www.w3.org/1999/xhtml" id="Par39" class="Para">
                    Although we have no data on the antimicrobial use for diarrheic patients in the current study, the recent standard treatment guideline prepared by Drug Administration and Control Authority of Ethiopia for severe cases of infectious gastroenteritis including NTS recommends sulfamethoxazole + trimethoprim, ciprofloxacin and chloramphenicol [<span class="CitationRef">
                      <a href="#CR50">50</a>
                    </span>]. However, resistance to these antimicrobials was low in <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> isolates in the current study probably due to the fact that these isolates were mainly obtained from patients attending primary health centers and were not exposed to prolonged selective pressure of antimicrobials. Drugs like streptomycin, nitrofurantoin, sulfonamides and ampicillin have long been used for management of various infections in the country and high rate of resistance to these drugs might have developed as a consequence of this prolonged use.
                  </p>
                </div>
              </section>
              <section xmlns="" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:meta="http://www.springer.com/app/meta" id="Sec20" class="Section1 RenderAsSection1">
                <h2 class="Heading js-ToggleCollapseSection">Conclusions</h2>
                <div class="js-CollapseSection">
                  <p xmlns="http://www.w3.org/1999/xhtml" id="Par40" class="Para">
                    There was no significant association of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> infection with co-occurring parasites but there was significant association of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> infection with consumption of raw vegetables. The dominant NTS serotypes at the primary health care units in Addis Ababa were <em xmlns="" class="EmphasisTypeItalic">S.</em> Typhimurium, <em xmlns="" class="EmphasisTypeItalic">S</em>. Virchow and <em xmlns="" class="EmphasisTypeItalic">S</em>. Kottbus with variable antimicrobial resistance phenotypes. Although their proportion was low, <em xmlns="" class="EmphasisTypeItalic">S.</em> Kentucky and <em xmlns="" class="EmphasisTypeItalic">S.</em> Concord demonstrated extensive MDR. Further characterization on molecular resistance determinants and continuous monitoring of circulating serotypes and antimicrobial resistance profile is recommended. As the extent of MDR appears to be dependent on serotypes involved, it is vital to have at least one national <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> reference laboratory to conduct serotyping of <em xmlns="" class="EmphasisTypeItalic">Salmonella</em> isolates from all regions of Ethiopia.
                  </p>
                </div>
              </section>
              <section xmlns="" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:meta="http://www.springer.com/app/meta" class="AbbreviationGroup">
                <h2 class="Heading js-ToggleCollapseSection">Abbreviations</h2>
                <div class="js-CollapseSection">
                  <div class="DefinitionList">
                    <dl class="DefinitionListEntry">
                      <dt class="Term">
                        <dfn>ALIPB:&nbsp;</dfn>
                      </dt>
                      <dd class="Description">
                        <p xmlns="http://www.w3.org/1999/xhtml" id="Par5" class="Para">Aklilu Lemma Institute of Pathobiology</p>
                      </dd>
                    </dl>
                    <dl class="DefinitionListEntry">
                      <dt class="Term">
                        <dfn>MDR:&nbsp;</dfn>
                      </dt>
                      <dd class="Description">
                        <p xmlns="http://www.w3.org/1999/xhtml" id="Par6" class="Para">Multi-drug resistance</p>
                      </dd>
                    </dl>
                    <dl class="DefinitionListEntry">
                      <dt class="Term">
                        <dfn>NTS:&nbsp;</dfn>
                      </dt>
                      <dd class="Description">
                        <p xmlns="http://www.w3.org/1999/xhtml" id="Par7" class="Para">
                          Non-typhoidal <em xmlns="" class="EmphasisTypeItalic">Salmonella</em>
                        </p>
                      </dd>
                    </dl>
                    <dl class="DefinitionListEntry">
                      <dt class="Term">
                        <dfn>RVB:&nbsp;</dfn>
                      </dt>
                      <dd class="Description">
                        <p xmlns="http://www.w3.org/1999/xhtml" id="Par8" class="Para">Rappaport-Vassiliadis Broth</p>
                      </dd>
                    </dl>
                    <dl class="DefinitionListEntry">
                      <dt class="Term">
                        <dfn>TASH:&nbsp;</dfn>
                      </dt>
                      <dd class="Description">
                        <p xmlns="http://www.w3.org/1999/xhtml" id="Par9" class="Para">Tikur Anbessa Specialized Hospital</p>
                      </dd>
                    </dl>
                    <dl class="DefinitionListEntry">
                      <dt class="Term">
                        <dfn>TTB:&nbsp;</dfn>
                      </dt>
                      <dd class="Description">
                        <p xmlns="http://www.w3.org/1999/xhtml" id="Par10" class="Para">Tetrathionate broth</p>
                      </dd>
                    </dl>
                    <dl class="DefinitionListEntry">
                      <dt class="Term">
                        <dfn>WHO:&nbsp;</dfn>
                      </dt>
                      <dd class="Description">
                        <p xmlns="http://www.w3.org/1999/xhtml" id="Par11" class="Para">World Health Organization</p>
                      </dd>
                    </dl>
                  </div>
                </div>
              </section>
              <section xmlns="" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:meta="http://www.springer.com/app/meta" class="Section1 RenderAsSection1" id="Declarations">
                <h2 class="Heading js-ToggleCollapseSection">
                  Declarations
                </h2>
                <div class="js-CollapseSection">
                  <div xmlns="http://www.w3.org/1999/xhtml" class="Acknowledgments">
                    <h3 xmlns="" class="Heading">Acknowledgments</h3>
                    <p xmlns="" class="SimplePara">
                      This study was financially supported by The National Institutes of Health (NIH) Fogarty International Center (grant D43TW008650) to W.A.G./J.S.G., R56AI109002 to J.S.G. and WHO/AGISAR to T.E. We are grateful to Dr Roger P. Johnson and Ann Perets of the Laboratory of Foodborne Zoonoses, Public Health Agency of Canada for serotyping and phage typing of the <em class="EmphasisTypeItalic">Salmonella</em> isolates. We are extremely grateful to Dr. Girmay Medhin for the technical contribution to the statistical analysis. We are thankful for cooperation of laboratory technicians at health centers and TASH during sample collection. Technical assistance of Mr. Ephrem Eguale in sample collection was greatly appreciated.
                    </p>
                  </div>
                  <div xmlns="http://www.w3.org/1999/xhtml" class="License">
                    <p xmlns="" class="SimplePara">
                      <strong class="EmphasisTypeBold">Open Access</strong>This article is distributed under the terms of the Creative Commons Attribution 4.0 International License (<span xmlns="http://www.w3.org/1999/xhtml" class="ExternalRef">
                        <a href="http://creativecommons.org/licenses/by/4.0/">
                          <span class="RefSource">http://creativecommons.org/licenses/by/4.0/</span>
                        </a>
                      </span>), which permits unrestricted use, distribution, and reproduction in any medium, provided you give appropriate credit to the original author(s) and the source, provide a link to the Creative Commons license, and indicate if changes were made. The Creative Commons Public Domain Dedication waiver (<span xmlns="http://www.w3.org/1999/xhtml" class="ExternalRef">
                        <a href="http://creativecommons.org/publicdomain/zero/1.0/">
                          <span class="RefSource">http://creativecommons.org/publicdomain/zero/1.0/</span>
                        </a>
                      </span>) applies to the data made available in this article, unless otherwise stated.
                    </p>
                  </div>
                  <aside class="Appendix" id="App1">

                    <h3 class="Heading">Additional files</h3>
                    <div id="widgetContainer"></div>
                    <div xmlns="http://www.w3.org/1999/xhtml" id="Par41" class="Para">
                      <div class="MediaObject" id="MOESM1">
                        <div xmlns="" class="esm-item ">
                          <div xmlns="http://www.w3.org/1999/xhtml" class="caption-container">
                            <a href="https://static-content.springer.com/esm/art%3A10.1186%2Fs12879-015-1235-y/MediaObjects/12879_2015_1235_MOESM1_ESM.docx">
                              <span class="caption-number">Additional file 1: Table S1.</span>
                            </a>
                            <span xmlns="" class="SimplePara">
                              Resistance pattern of <em class="EmphasisTypeItalic">Salmonella</em> serotypes recovered from the study participants. (DOCX 15 kb)
                            </span>
                          </div>
                        </div>
                      </div>
                    </div>

                  </aside>
                  <aside xmlns="http://www.w3.org/1999/xhtml" class="ArticleNote ArticleNoteMisc">
                    <h3 xmlns="" class="Heading">Competing interests</h3>
                    <p xmlns="" class="SimplePara">The authors declare that they have no competing interests.</p>
                  </aside>
                  <aside xmlns="http://www.w3.org/1999/xhtml" class="ArticleNote ArticleNoteMisc">
                    <h3 xmlns="" class="Heading">Authors’ contributions</h3>
                    <p xmlns="" class="SimplePara">TE, WAG, DA, JSG and EE, participated in conception of the study and review of the draft manuscript. TE was involved in sample collection laboratory investigation and preparation of the draft manuscript. HA participated in laboratory work. All authors read and approved the final manuscript.</p>
                  </aside>
                </div>
              </section>
            </div>


            <!--隐藏部分 内容包括单位id,该单位id的单位内容，以及该单位的编号-->
            <div class="FulltextWrapper">
              <section xmlns="" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:meta="http://www.springer.com/app/meta" class="Section1 RenderAsSection1 Affiliations Affiliations--enhanced" id="Aff">
                <h2 class="Heading js-ToggleCollapseSection">Authors’ Affiliations</h2>
                <div class="js-CollapseSection">
                  <div class="Affiliation" id="Aff1">
                    <span class="AffiliationNumber">(1)</span>
                    <div class="AffiliationText">Aklilu Lemma Institute of Pathobiology, Addis Ababa University</div>
                  </div>
                  <div class="Affiliation" id="Aff2">
                    <span class="AffiliationNumber">(2)</span>
                    <div class="AffiliationText">Department of Veterinary Preventive Medicine, The Ohio State University</div>
                  </div>
                  <div class="Affiliation" id="Aff3">
                    <span class="AffiliationNumber">(3)</span>
                    <div class="AffiliationText">Department of Microbiology, Immunology &amp; Parasitology, School of Medicine, College of Health Sciences, Addis Ababa University</div>
                  </div>
                  <div class="Affiliation" id="Aff4">
                    <span class="AffiliationNumber">(4)</span>
                    <div class="AffiliationText">Department of Microbial Infection and Immunity, Center for Microbial Interface Biology, The Ohio State University</div>
                  </div>
                  <div class="Affiliation" id="Aff5">
                    <span class="AffiliationNumber">(5)</span>
                    <div class="AffiliationText">Department of Pharmacology and Clinical Pharmacy, School of Pharmacy, College of Health Sciences, Addis Ababa University</div>
                  </div>
                </div>
              </section>
            </div>


            <!--引用-->
            <div class="FulltextWrapper">
              <section xmlns="" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:meta="http://www.springer.com/app/meta" class="Section1 RenderAsSection1 SectionTypeMaterialsAndMethods" id="Bib1">
                <h2 class="Heading js-ToggleCollapseSection">References</h2>
                <div class="js-CollapseSection">
                  <ol class="BibliographyWrapper">
                    <li class="Citation">
                      <cite class="CitationContent" id="CR1">
                        Majowicz SE, Musto J, Scallan E, Angulo FJ, Kirk M, O’Brien SJ, et al. The global burden of nontyphoidal Salmonella gastroenteritis. Clin Infect Dis. 2010;50(6):882–9.<span class="Occurrences">
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1086/650733">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=20158401">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=The%20global%20burden%20of%20nontyphoidal%20Salmonella%20gastroenteritis&amp;author=SE.%20Majowicz&amp;author=J.%20Musto&amp;author=E.%20Scallan&amp;author=FJ.%20Angulo&amp;author=M.%20Kirk&amp;author=SJ.%20O%E2%80%99Brien&amp;author=TF.%20Jones&amp;author=A.%20Fazil&amp;author=RM.%20Hoekstra&amp;journal=Clin%20Infect%20Dis&amp;volume=50&amp;issue=6&amp;pages=882-889&amp;publication_year=2010">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR2">
                        Gal-Mor O, Boyle EC, Grassl GA. Same species, different diseases: how and why typhoidal and non-typhoidal Salmonella enterica serovars differ. Front Microbiol. 2014;5:391.<span class="Occurrences">
                          <span class="Occurrence OccurrencePMCID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4120697">
                              <span>
                                <span>PubMed Central</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=25136336">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Same%20species%2C%20different%20diseases%3A%20how%20and%20why%20typhoidal%20and%20non-typhoidal%20Salmonella%20enterica%20serovars%20differ&amp;author=O.%20Gal-Mor&amp;author=EC.%20Boyle&amp;author=GA.%20Grassl&amp;journal=Front%20Microbiol&amp;volume=5&amp;pages=391&amp;publication_year=2014">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR3">
                        Haeusler GM, Curtis N. Non-typhoidal Salmonella in children: microbiology, epidemiology and treatment. Adv Exp Med Biol. 2013;764:13–26.<span class="Occurrences">
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1007/978-1-4614-4726-9_2">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=23654054">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Non-typhoidal%20Salmonella%20in%20children%3A%20microbiology%2C%20epidemiology%20and%20treatment&amp;author=GM.%20Haeusler&amp;author=N.%20Curtis&amp;journal=Adv%20Exp%20Med%20Biol&amp;volume=764&amp;pages=13-26&amp;publication_year=2013">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR4">
                        Braden CR. Salmonella enterica serotype Enteritidis and eggs: a national epidemic in the United States. Clin Infect Dis. 2006;43(4):512–7.<span class="Occurrences">
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1086/505973">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=16838242">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Salmonella%20enterica%20serotype%20Enteritidis%20and%20eggs%3A%20a%20national%20epidemic%20in%20the%20United%20States&amp;author=CR.%20Braden&amp;journal=Clin%20Infect%20Dis&amp;volume=43&amp;issue=4&amp;pages=512-517&amp;publication_year=2006">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR5">
                        Fey PD, Safranek TJ, Rupp ME, Dunne EF, Ribot E, Iwen PC, et al. Ceftriaxone-resistant salmonella infection acquired by a child from cattle. N Engl J Med. 2000;342(17):1242–9.<span class="Occurrences">
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1056/NEJM200004273421703">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=10781620">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Ceftriaxone-resistant%20salmonella%20infection%20acquired%20by%20a%20child%20from%20cattle&amp;author=PD.%20Fey&amp;author=TJ.%20Safranek&amp;author=ME.%20Rupp&amp;author=EF.%20Dunne&amp;author=E.%20Ribot&amp;author=PC.%20Iwen&amp;author=PA.%20Bradford&amp;author=FJ.%20Angulo&amp;author=SH.%20Hinrichs&amp;journal=N%20Engl%20J%20Med&amp;volume=342&amp;issue=17&amp;pages=1242-1249&amp;publication_year=2000">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR6">
                        Jansen A, Frank C, Stark K. Pork and pork products as a source for human salmonellosis in Germany. Berl Munch Tierarztl Wochenschr. 2007;120(7–8):340–6.<span class="Occurrences">
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=17715827">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Pork%20and%20pork%20products%20as%20a%20source%20for%20human%20salmonellosis%20in%20Germany&amp;author=A.%20Jansen&amp;author=C.%20Frank&amp;author=K.%20Stark&amp;journal=Berl%20Munch%20Tierarztl%20Wochenschr&amp;volume=120&amp;issue=7%E2%80%938&amp;pages=340-346&amp;publication_year=2007">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR7">
                        Hohmann EL. Nontyphoidal salmonellosis. Clin Infect Dis. 2001;32(2):263–9.<span class="Occurrences">
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1086/318457">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=11170916">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Nontyphoidal%20salmonellosis&amp;author=EL.%20Hohmann&amp;journal=Clin%20Infect%20Dis&amp;volume=32&amp;issue=2&amp;pages=263-269&amp;publication_year=2001">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR8">
                        Mermin J, Hutwagner L, Vugia D, Shallow S, Daily P, Bender J, et al. Reptiles, amphibians, and human Salmonella infection: a population-based, case–control study. Clin Infect Dis. 2004;38 Suppl 3:S253–261.<span class="Occurrences">
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1086/381594">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=15095197">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Reptiles%2C%20amphibians%2C%20and%20human%20Salmonella%20infection%3A%20a%20population-based%2C%20case%E2%80%93control%20study&amp;author=J.%20Mermin&amp;author=L.%20Hutwagner&amp;author=D.%20Vugia&amp;author=S.%20Shallow&amp;author=P.%20Daily&amp;author=J.%20Bender&amp;author=J.%20Koehler&amp;author=R.%20Marcus&amp;author=FJ.%20Angulo&amp;journal=Clin%20Infect%20Dis&amp;volume=38&amp;issue=Suppl%203&amp;pages=S253-261&amp;publication_year=2004">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR9">
                        Bayer C, Bernard H, Prager R, Rabsch W, Hiller P, Malorny B, Pfefferkorn B, Frank C, de Jong A, Friesema I et al.: An outbreak of Salmonella Newport associated with mung bean sprouts in Germany and the Netherlands, October to November 2011. Euro Surveill 2014, 19(1).<span class="Occurrences"></span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR10">
                        Lienemann T, Niskanen T, Guedes S, Siitonen A, Kuusi M, Rimhanen-Finne R. Iceberg lettuce as suggested source of a nationwide outbreak caused by two Salmonella serotypes, Newport and Reading, in Finland in 2008. J Food Prot. 2011;74(6):1035–40.<span class="Occurrences">
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.4315/0362-028X.JFP-10-455">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=21669088">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Iceberg%20lettuce%20as%20suggested%20source%20of%20a%20nationwide%20outbreak%20caused%20by%20two%20Salmonella%20serotypes%2C%20Newport%20and%20Reading%2C%20in%20Finland%20in%202008&amp;author=T.%20Lienemann&amp;author=T.%20Niskanen&amp;author=S.%20Guedes&amp;author=A.%20Siitonen&amp;author=M.%20Kuusi&amp;author=R.%20Rimhanen-Finne&amp;journal=J%20Food%20Prot&amp;volume=74&amp;issue=6&amp;pages=1035-1040&amp;publication_year=2011">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR11">
                        Jackson BR, Griffin PM, Cole D, Walsh KA, Chai SJ. Outbreak-associated Salmonella enterica serotypes and food Commodities, United States, 1998–2008. Emerg Infect Dis. 2013;19(8):1239–44.<span class="Occurrences">
                          <span class="Occurrence OccurrencePMCID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3739514">
                              <span>
                                <span>PubMed Central</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.3201/eid1908.121511">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=23876503">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Outbreak-associated%20Salmonella%20enterica%20serotypes%20and%20food%20Commodities%2C%20United%20States%2C%201998%E2%80%932008&amp;author=BR.%20Jackson&amp;author=PM.%20Griffin&amp;author=D.%20Cole&amp;author=KA.%20Walsh&amp;author=SJ.%20Chai&amp;journal=Emerg%20Infect%20Dis&amp;volume=19&amp;issue=8&amp;pages=1239-1244&amp;publication_year=2013">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR12">
                        Foley SL, Lynne AM. Food animal-associated Salmonella challenges: pathogenicity and antimicrobial resistance. J Anim Sci. 2008;86(14 Suppl):E173–187.<span class="Occurrences">
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=17878285">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Food%20animal-associated%20Salmonella%20challenges%3A%20pathogenicity%20and%20antimicrobial%20resistance&amp;author=SL.%20Foley&amp;author=AM.%20Lynne&amp;journal=J%20Anim%20Sci&amp;volume=86&amp;issue=14%20Suppl&amp;pages=E173-187&amp;publication_year=2008">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR13">
                        Dutta U, Garg PK, Kumar R, Tandon RK. Typhoid carriers among patients with gallstones are at increased risk for carcinoma of the gallbladder. Am J Gastroenterol. 2000;95(3):784–7.<span class="Occurrences">
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1111/j.1572-0241.2000.01860.x">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=10710075">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Typhoid%20carriers%20among%20patients%20with%20gallstones%20are%20at%20increased%20risk%20for%20carcinoma%20of%20the%20gallbladder&amp;author=U.%20Dutta&amp;author=PK.%20Garg&amp;author=R.%20Kumar&amp;author=RK.%20Tandon&amp;journal=Am%20J%20Gastroenterol&amp;volume=95&amp;issue=3&amp;pages=784-787&amp;publication_year=2000">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR14">
                        Van Meervenne E, Botteldoorn N, Lokietek S, Vatlet M, Cupa A, Naranjo M, et al. Turtle-associated Salmonella septicaemia and meningitis in a 2-month-old baby. J Med Microbiol. 2009;58(Pt 10):1379–81.<span class="Occurrences">
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1099/jmm.0.012146-0">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=19528160">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Turtle-associated%20Salmonella%20septicaemia%20and%20meningitis%20in%20a%202-month-old%20baby&amp;author=E.%20Meervenne&amp;author=N.%20Botteldoorn&amp;author=S.%20Lokietek&amp;author=M.%20Vatlet&amp;author=A.%20Cupa&amp;author=M.%20Naranjo&amp;author=K.%20Dierick&amp;author=S.%20Bertrand&amp;journal=J%20Med%20Microbiol&amp;volume=58&amp;issue=Pt%2010&amp;pages=1379-1381&amp;publication_year=2009">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR15">
                        Collard JM, Place S, Denis O, Rodriguez-Villalobos H, Vrints M, Weill FX, et al. Travel-acquired salmonellosis due to Salmonella Kentucky resistant to ciprofloxacin, ceftriaxone and co-trimoxazole and associated with treatment failure. J Antimicrob Chemother. 2007;60(1):190–2.<span class="Occurrences">
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1093/jac/dkm114">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=17449886">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Travel-acquired%20salmonellosis%20due%20to%20Salmonella%20Kentucky%20resistant%20to%20ciprofloxacin%2C%20ceftriaxone%20and%20co-trimoxazole%20and%20associated%20with%20treatment%20failure&amp;author=JM.%20Collard&amp;author=S.%20Place&amp;author=O.%20Denis&amp;author=H.%20Rodriguez-Villalobos&amp;author=M.%20Vrints&amp;author=FX.%20Weill&amp;author=S.%20Baucheron&amp;author=A.%20Cloeckaert&amp;author=M.%20Struelens&amp;author=S.%20Bertrand&amp;journal=J%20Antimicrob%20Chemother&amp;volume=60&amp;issue=1&amp;pages=190-192&amp;publication_year=2007">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR16">
                        Onwuezobe IA, Oshun PO, Odigwe CC. Antimicrobials for treating symptomatic non-typhoidal Salmonella infection. Cochrane Database Syst Rev. 2012;11:CD001167.<span class="Occurrences">
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=23152205">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Antimicrobials%20for%20treating%20symptomatic%20non-typhoidal%20Salmonella%20infection&amp;author=IA.%20Onwuezobe&amp;author=PO.%20Oshun&amp;author=CC.%20Odigwe&amp;journal=Cochrane%20Database%20Syst%20Rev&amp;volume=11&amp;pages=CD001167&amp;publication_year=2012">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR17">
                        Lengerh A, Moges F, Unakal C, Anagaw B. Prevalence, associated risk factors and antimicrobial susceptibility pattern of Campylobacter species among under five diarrheic children at Gondar University Hospital, Northwest Ethiopia. BMC Pediatr. 2013;13:82.<span class="Occurrences">
                          <span class="Occurrence OccurrencePMCID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3663702">
                              <span>
                                <span>PubMed Central</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1186/1471-2431-13-82">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=23694714">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Prevalence%2C%20associated%20risk%20factors%20and%20antimicrobial%20susceptibility%20pattern%20of%20Campylobacter%20species%20among%20under%20five%20diarrheic%20children%20at%20Gondar%20University%20Hospital%2C%20Northwest%20Ethiopia&amp;author=A.%20Lengerh&amp;author=F.%20Moges&amp;author=C.%20Unakal&amp;author=B.%20Anagaw&amp;journal=BMC%20Pediatr&amp;volume=13&amp;pages=82&amp;publication_year=2013">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR18">
                        Debas G, Kibret M, Biadglegne F, Abera B. Prevalence and antimicrobial susceptibility patterns of shigella species at Felege Hiwot Referral Hospital Northwest Ethiopia. Ethiop Med J. 2011;49(3):249–56.<span class="Occurrences">
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=21991758">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Prevalence%20and%20antimicrobial%20susceptibility%20patterns%20of%20shigella%20species%20at%20Felege%20Hiwot%20Referral%20Hospital%20Northwest%20Ethiopia&amp;author=G.%20Debas&amp;author=M.%20Kibret&amp;author=F.%20Biadglegne&amp;author=B.%20Abera&amp;journal=Ethiop%20Med%20J&amp;volume=49&amp;issue=3&amp;pages=249-256&amp;publication_year=2011">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR19">
                        Parashar UD, Burton A, Lanata C, Boschi-Pinto C, Shibuya K, Steele D, et al. Global mortality associated with rotavirus disease among children in 2004. J Infect Dis. 2009;200 Suppl 1:S9–S15.<span class="Occurrences">
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1086/605025">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=19817620">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Global%20mortality%20associated%20with%20rotavirus%20disease%20among%20children%20in%202004&amp;author=UD.%20Parashar&amp;author=A.%20Burton&amp;author=C.%20Lanata&amp;author=C.%20Boschi-Pinto&amp;author=K.%20Shibuya&amp;author=D.%20Steele&amp;author=M.%20Birmingham&amp;author=RI.%20Glass&amp;journal=J%20Infect%20Dis&amp;volume=200&amp;issue=Suppl%201&amp;pages=S9-S15&amp;publication_year=2009">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR20">
                        Beyene G, Nair S, Asrat D, Mengistu Y, Engers H, Wain J. Multidrug resistant Salmonella concord is a major cause of salmonellosis in children in Ethiopia. J Infect Dev Ctries. 2011;5:23–33.<span class="Occurrences">
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=21330737">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Multidrug%20resistant%20Salmonella%20concord%20is%20a%20major%20cause%20of%20salmonellosis%20in%20children%20in%20Ethiopia&amp;author=G.%20Beyene&amp;author=S.%20Nair&amp;author=D.%20Asrat&amp;author=Y.%20Mengistu&amp;author=H.%20Engers&amp;author=J.%20Wain&amp;journal=J%20Infect%20Dev%20Ctries&amp;volume=5&amp;pages=23-33&amp;publication_year=2011">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR21">
                        van Duijkeren E, Wannet WJ, Houwers DJ, van Pelt W. Antimicrobial susceptibilities of salmonella strains isolated from humans, cattle, pigs, and chickens in the Netherlands from 1984 to 2001. J Clin Microbiol. 2003;41(8):3574–8.<span class="Occurrences">
                          <span class="Occurrence OccurrencePMCID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC179820">
                              <span>
                                <span>PubMed Central</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1128/JCM.41.8.3574-3578.2003">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=12904357">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Antimicrobial%20susceptibilities%20of%20salmonella%20strains%20isolated%20from%20humans%2C%20cattle%2C%20pigs%2C%20and%20chickens%20in%20the%20Netherlands%20from%201984%20to%202001&amp;author=E.%20Duijkeren&amp;author=WJ.%20Wannet&amp;author=DJ.%20Houwers&amp;author=W.%20Pelt&amp;journal=J%20Clin%20Microbiol&amp;volume=41&amp;issue=8&amp;pages=3574-3578&amp;publication_year=2003">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR22">
                        Davis MA, Hancock DD, Besser TE, Rice DH, Gay JM, Gay C, et al. Changes in antimicrobial resistance among Salmonella enterica Serovar typhimurium isolates from humans and cattle in the Northwestern United States, 1982–1997. Emerg Infect Dis. 1999;5(6):802–6.<span class="Occurrences">
                          <span class="Occurrence OccurrencePMCID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2640791">
                              <span>
                                <span>PubMed Central</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.3201/eid0506.990610">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=10603215">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Changes%20in%20antimicrobial%20resistance%20among%20Salmonella%20enterica%20Serovar%20typhimurium%20isolates%20from%20humans%20and%20cattle%20in%20the%20Northwestern%20United%20States%2C%201982%E2%80%931997&amp;author=MA.%20Davis&amp;author=DD.%20Hancock&amp;author=TE.%20Besser&amp;author=DH.%20Rice&amp;author=JM.%20Gay&amp;author=C.%20Gay&amp;author=L.%20Gearhart&amp;author=R.%20DiGiacomo&amp;journal=Emerg%20Infect%20Dis&amp;volume=5&amp;issue=6&amp;pages=802-806&amp;publication_year=1999">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR23">
                        Cailhol J, Lailler R, Bouvet P, La Vieille S, Gauchard F, Sanders P, et al. Trends in antimicrobial resistance phenotypes in non-typhoid Salmonellae from human and poultry origins in France. Epidemiol Infect. 2006;134(1):171–8.<span class="Occurrences">
                          <span class="Occurrence OccurrencePMCID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2870370">
                              <span>
                                <span>PubMed Central</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1017/S0950268805004863">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=16409665">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Trends%20in%20antimicrobial%20resistance%20phenotypes%20in%20non-typhoid%20Salmonellae%20from%20human%20and%20poultry%20origins%20in%20France&amp;author=J.%20Cailhol&amp;author=R.%20Lailler&amp;author=P.%20Bouvet&amp;author=S.%20Vieille&amp;author=F.%20Gauchard&amp;author=P.%20Sanders&amp;author=A.%20Brisabois&amp;journal=Epidemiol%20Infect&amp;volume=134&amp;issue=1&amp;pages=171-178&amp;publication_year=2006">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR24">
                        Ashenafi M, Gedebou M. Salmonella and Shigella in adult diarrhoea in Addis Ababa--prevalence and antibiograms. Trans R Soc Trop Med Hyg. 1985;79(5):719–21.<span class="Occurrences">
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1016/0035-9203(85)90201-9">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=4095752">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Salmonella%20and%20Shigella%20in%20adult%20diarrhoea%20in%20Addis%20Ababa--prevalence%20and%20antibiograms&amp;author=M.%20Ashenafi&amp;author=M.%20Gedebou&amp;journal=Trans%20R%20Soc%20Trop%20Med%20Hyg&amp;volume=79&amp;issue=5&amp;pages=719-721&amp;publication_year=1985">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR25">
                        Mache AMY, Cowley C. <em class="EmphasisTypeItalic">Salmonella</em> sero groups identified from adult diarrheal out-patients in Addis Ababa, Ethiopia: antibiotic resistance and plasmid profile analysis. East African Med J. 1997;74:183–6.<span class="Occurrences">
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20Salmonella%20sero%20groups%20identified%20from%20adult%20diarrheal%20out-patients%20in%20Addis%20Ababa%2C%20Ethiopia%3A%20antibiotic%20resistance%20and%20plasmid%20profile%20analysis&amp;author=AMY.%20Mache&amp;author=C.%20Cowley&amp;journal=East%20African%20Med%20J&amp;volume=74&amp;pages=183-186&amp;publication_year=1997">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR26">
                        Gebre-Yohannes A, Mammo K, Wolde H. R-factor-mediated multidrug resistance in Salmonella typhimurium isolates. Ethiop Med J. 1987;25(1):53–4.<span class="Occurrences">
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=3545819">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=R-factor-mediated%20multidrug%20resistance%20in%20Salmonella%20typhimurium%20isolates&amp;author=A.%20Gebre-Yohannes&amp;author=K.%20Mammo&amp;author=H.%20Wolde&amp;journal=Ethiop%20Med%20J&amp;volume=25&amp;issue=1&amp;pages=53-54&amp;publication_year=1987">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR27">
                        WHO: Diarrheal Diseases. In: World Health Organization; Fact sheet No.330; 2013. <span xmlns="http://www.w3.org/1999/xhtml" class="ExternalRef">
                          <a href="http://www.who.int/mediacentre/factsheets/fs330/en/">
                            <span class="RefSource">http://www.who.int/mediacentre/factsheets/fs330/en/</span>
                          </a>
                        </span>. Accessed 10 April 2015.<span class="Occurrences"></span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR28">
                        Lewis SJ, Heaton KW. Stool form scale as a useful guide to intestinal transit time. Scand J Gastroenterol. 1997;32(9):920–4.<span class="Occurrences">
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.3109/00365529709011203">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=9299672">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Stool%20form%20scale%20as%20a%20useful%20guide%20to%20intestinal%20transit%20time&amp;author=SJ.%20Lewis&amp;author=KW.%20Heaton&amp;journal=Scand%20J%20Gastroenterol&amp;volume=32&amp;issue=9&amp;pages=920-924&amp;publication_year=1997">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR29">
                        WHO. WHO Global Foodborne Infections Network . Laboratory Protocol. In: Isolation of Salmonella spp From Food and Animal Faeces. 5th ed. 2010.<span class="Occurrences">
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=WHO%20Global%20Foodborne%20Infections%20Network%20.%20Laboratory%20Protocol&amp;publication_year=2010">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR30">
                        Cohen ND, Neibergs HL, McGruder ED, Whitford HW, Behle RW, Ray PM, et al. Genus-specific detection of salmonellae using the polymerase chain reaction (PCR). J Vet Diagn Invest. 1993;5(3):368–71.<span class="Occurrences">
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1177/104063879300500311">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=8373849">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Genus-specific%20detection%20of%20salmonellae%20using%20the%20polymerase%20chain%20reaction%20%28PCR%29&amp;author=ND.%20Cohen&amp;author=HL.%20Neibergs&amp;author=ED.%20McGruder&amp;author=HW.%20Whitford&amp;author=RW.%20Behle&amp;author=PM.%20Ray&amp;author=BM.%20Hargis&amp;journal=J%20Vet%20Diagn%20Invest&amp;volume=5&amp;issue=3&amp;pages=368-371&amp;publication_year=1993">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR31">
                        Ewing. Serological Identificaiton of Salmonella. 1986.<span class="Occurrences">
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Serological%20Identificaiton%20of%20Salmonella&amp;publication_year=1986">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR32">
                        Shipp CR, Rowe B. A mechanised microtechnique for salmonella serotyping. J Clin Pathol. 1980;33(6):595–7.<span class="Occurrences">
                          <span class="Occurrence OccurrencePMCID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC1146150">
                              <span>
                                <span>PubMed Central</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1136/jcp.33.6.595">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=7400362">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=A%20mechanised%20microtechnique%20for%20salmonella%20serotyping&amp;author=CR.%20Shipp&amp;author=B.%20Rowe&amp;journal=J%20Clin%20Pathol&amp;volume=33&amp;issue=6&amp;pages=595-597&amp;publication_year=1980">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR33">
                        Grimont P, Weill F-X. Antigenic formulas of Salmonella Serotypes. 9th ed. France: WHO Collaborating Centre for Reference and Research on Salmonella; 2007.<span class="Occurrences">
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Antigenic%20formulas%20of%20Salmonella%20Serotypes&amp;author=P.%20Grimont&amp;author=F-X.%20Weill&amp;publication_year=2007">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR34">
                        CALLOW BR. A new phage-typing scheme for Salmonella typhi-murium. J Hyg (Lond). 1959;57:346–59.<span class="Occurrences">
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1017/S0022172400020209">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=A%20new%20phage-typing%20scheme%20for%20Salmonella%20typhi-murium&amp;author=BR.%20CALLOW&amp;journal=J%20Hyg%20%28Lond%29&amp;volume=57&amp;pages=346-359&amp;publication_year=1959">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR35">
                        Anderson ES, Ward LR, Saxe MJ, de Sa JD. Bacteriophage-typing designations of Salmonella typhimurium. J Hyg (Lond). 1977;78(2):297–300.<span class="Occurrences">
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1017/S0022172400056187">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Bacteriophage-typing%20designations%20of%20Salmonella%20typhimurium&amp;author=ES.%20Anderson&amp;author=LR.%20Ward&amp;author=MJ.%20Saxe&amp;author=JD.%20Sa&amp;journal=J%20Hyg%20%28Lond%29&amp;volume=78&amp;issue=2&amp;pages=297-300&amp;publication_year=1977">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR36">
                        CLSI: Performance Standards for Antimicrobial Susceptibility Testing: Twenty-third Informational Supplement. Clinical and Laboratory Standards Institute, Wayne, PA; 2013.<span class="Occurrences"></span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR37">
                        Beyene G, Tasew H. Prevalence of intestinal parasite, Shigella and Salmonella species among diarrheal children in Jimma health center Jimma southwest Ethiopia: a cross sectional study. Ann Clin Microbiol Antimicrob. 2014;13:10.<span class="Occurrences">
                          <span class="Occurrence OccurrencePMCID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3922032">
                              <span>
                                <span>PubMed Central</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1186/1476-0711-13-10">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=24499189">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Prevalence%20of%20intestinal%20parasite%2C%20Shigella%20and%20Salmonella%20species%20among%20diarrheal%20children%20in%20Jimma%20health%20center%20Jimma%20southwest%20Ethiopia%3A%20a%20cross%20sectional%20study&amp;author=G.%20Beyene&amp;author=H.%20Tasew&amp;journal=Ann%20Clin%20Microbiol%20Antimicrob&amp;volume=13&amp;pages=10&amp;publication_year=2014">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR38">
                        Tadesse G. Prevalence of human Salmonellosis in Ethiopia: a systematic review and meta-analysis. BMC Infect Dis. 2014;14:88.<span class="Occurrences">
                          <span class="Occurrence OccurrencePMCID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3936990">
                              <span>
                                <span>PubMed Central</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1186/1471-2334-14-88">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=24552273">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Prevalence%20of%20human%20Salmonellosis%20in%20Ethiopia%3A%20a%20systematic%20review%20and%20meta-analysis&amp;author=G.%20Tadesse&amp;journal=BMC%20Infect%20Dis&amp;volume=14&amp;pages=88&amp;publication_year=2014">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR39">
                        Guchi B, Ashenafi M. Microbial load, prevalence and antibiograms of Salmonella and Shigella in lettuce and green peppers. Ethiop J Health Sci. 2010;20(1):41–8.<span class="Occurrences">
                          <span class="Occurrence OccurrencePMCID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3275899">
                              <span>
                                <span>PubMed Central</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=22434959">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Microbial%20load%2C%20prevalence%20and%20antibiograms%20of%20Salmonella%20and%20Shigella%20in%20lettuce%20and%20green%20peppers&amp;author=B.%20Guchi&amp;author=M.%20Ashenafi&amp;journal=Ethiop%20J%20Health%20Sci&amp;volume=20&amp;issue=1&amp;pages=41-48&amp;publication_year=2010">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR40">
                        Dugassa A, Bacha K, Ketema T. Microbiological Quality and Safety of some selected vegetables sold in Jimma town, SouthWestern Ethiopia. African J Environ Sci Technol. 2014;8(11):633–53.<span class="Occurrences">
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Microbiological%20Quality%20and%20Safety%20of%20some%20selected%20vegetables%20sold%20in%20Jimma%20town%2C%20SouthWestern%20Ethiopia&amp;author=A.%20Dugassa&amp;author=K.%20Bacha&amp;author=T.%20Ketema&amp;journal=African%20J%20Environ%20Sci%20Technol&amp;volume=8&amp;issue=11&amp;pages=633-653&amp;publication_year=2014">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR41">
                        Quiroz-Santiago C, Rodas-Suárez OR, Carlos RV, Fernández FJ, Quiñones-Ramírez EI, Vázquez-Salinas C. Prevalence of Salmonella in vegetables from Mexico. J Food Prot. 2009;72(6):1279–82.<span class="Occurrences">
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=19610340">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Prevalence%20of%20Salmonella%20in%20vegetables%20from%20Mexico&amp;author=C.%20Quiroz-Santiago&amp;author=OR.%20Rodas-Su%C3%A1rez&amp;author=RV.%20Carlos&amp;author=FJ.%20Fern%C3%A1ndez&amp;author=EI.%20Qui%C3%B1ones-Ram%C3%ADrez&amp;author=C.%20V%C3%A1zquez-Salinas&amp;journal=J%20Food%20Prot&amp;volume=72&amp;issue=6&amp;pages=1279-1282&amp;publication_year=2009">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR42">
                        Hanning IB, Nutt JD, Ricke SC. Salmonellosis outbreaks in the United States due to fresh produce: sources and potential intervention measures. Foodborne Pathog Dis. 2009;6(6):635–48.<span class="Occurrences">
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1089/fpd.2008.0232">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=19580447">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Salmonellosis%20outbreaks%20in%20the%20United%20States%20due%20to%20fresh%20produce%3A%20sources%20and%20potential%20intervention%20measures&amp;author=IB.%20Hanning&amp;author=JD.%20Nutt&amp;author=SC.%20Ricke&amp;journal=Foodborne%20Pathog%20Dis&amp;volume=6&amp;issue=6&amp;pages=635-648&amp;publication_year=2009">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR43">
                        Zheng J, Allard S, Reynolds S, Millner P, Arce G, Blodgett RJ, et al. Colonization and internalization of Salmonella enterica in tomato plants. Appl Environ Microbiol. 2013;79(8):2494–502.<span class="Occurrences">
                          <span class="Occurrence OccurrencePMCID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3623171">
                              <span>
                                <span>PubMed Central</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1128/AEM.03704-12">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=23377940">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Colonization%20and%20internalization%20of%20Salmonella%20enterica%20in%20tomato%20plants&amp;author=J.%20Zheng&amp;author=S.%20Allard&amp;author=S.%20Reynolds&amp;author=P.%20Millner&amp;author=G.%20Arce&amp;author=RJ.%20Blodgett&amp;author=EW.%20Brown&amp;journal=Appl%20Environ%20Microbiol&amp;volume=79&amp;issue=8&amp;pages=2494-2502&amp;publication_year=2013">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR44">
                        Gebre-Yohannes A. Salmonella from Ethiopia: prevalent species and their susceptibility to drugs. Ethiop Med J. 1985;23(3):97–102.<span class="Occurrences">
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=4006927">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Salmonella%20from%20Ethiopia%3A%20prevalent%20species%20and%20their%20susceptibility%20to%20drugs&amp;author=A.%20Gebre-Yohannes&amp;journal=Ethiop%20Med%20J&amp;volume=23&amp;issue=3&amp;pages=97-102&amp;publication_year=1985">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR45">
                        Lan R, Reeves PR, Octavia S. Population structure, origins and evolution of major Salmonella enterica clones. Infect Genet Evol. 2009;9(5):996–1005.<span class="Occurrences">
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1016/j.meegid.2009.04.011">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=19393770">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Population%20structure%2C%20origins%20and%20evolution%20of%20major%20Salmonella%20enterica%20clones&amp;author=R.%20Lan&amp;author=PR.%20Reeves&amp;author=S.%20Octavia&amp;journal=Infect%20Genet%20Evol&amp;volume=9&amp;issue=5&amp;pages=996-1005&amp;publication_year=2009">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR46">
                        Kariuki S, Revathi G, Kariuki N, Kiiru J, Mwituria J, Hart CA. Characterisation of community acquired non-typhoidal Salmonella from bacteraemia and diarrhoeal infections in children admitted to hospital in Nairobi. Kenya BMC Microbiol. 2006;6:101.<span class="Occurrences">
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1186/1471-2180-6-101">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=17173674">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Characterisation%20of%20community%20acquired%20non-typhoidal%20Salmonella%20from%20bacteraemia%20and%20diarrhoeal%20infections%20in%20children%20admitted%20to%20hospital%20in%20Nairobi&amp;author=S.%20Kariuki&amp;author=G.%20Revathi&amp;author=N.%20Kariuki&amp;author=J.%20Kiiru&amp;author=J.%20Mwituria&amp;author=CA.%20Hart&amp;journal=Kenya%20BMC%20Microbiol&amp;volume=6&amp;pages=101&amp;publication_year=2006">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR47">
                        Lunguya O, Lejon V, Phoba MF, Bertrand S, Vanhoof R, Glupczynski Y, et al. Antimicrobial resistance in invasive non-typhoid Salmonella from the Democratic Republic of the Congo: emergence of decreased fluoroquinolone susceptibility and extended-spectrum beta lactamases. PLoS Negl Trop Dis. 2013;7(3):e2103.<span class="Occurrences">
                          <span class="Occurrence OccurrencePMCID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3597487">
                              <span>
                                <span>PubMed Central</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1371/journal.pntd.0002103">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=23516651">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Antimicrobial%20resistance%20in%20invasive%20non-typhoid%20Salmonella%20from%20the%20Democratic%20Republic%20of%20the%20Congo%3A%20emergence%20of%20decreased%20fluoroquinolone%20susceptibility%20and%20extended-spectrum%20beta%20lactamases&amp;author=O.%20Lunguya&amp;author=V.%20Lejon&amp;author=MF.%20Phoba&amp;author=S.%20Bertrand&amp;author=R.%20Vanhoof&amp;author=Y.%20Glupczynski&amp;author=J.%20Verhaegen&amp;author=JJ.%20Muyembe-Tamfum&amp;author=J.%20Jacobs&amp;journal=PLoS%20Negl%20Trop%20Dis&amp;volume=7&amp;issue=3&amp;pages=e2103&amp;publication_year=2013">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR48">
                        Wolday D. Increase in the incidence of multidrug-resistant salmonellae in Ethiopia. J Antimicrob Chemother. 1998;41(3):421–3.<span class="Occurrences">
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1093/jac/41.3.421">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=9578175">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Increase%20in%20the%20incidence%20of%20multidrug-resistant%20salmonellae%20in%20Ethiopia&amp;author=D.%20Wolday&amp;journal=J%20Antimicrob%20Chemother&amp;volume=41&amp;issue=3&amp;pages=421-423&amp;publication_year=1998">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR49">
                        Kariuki S, Revathi G, Kiiru J, Lowe B, Berkley JA, Hart CA. Decreasing prevalence of antimicrobial resistance in non-typhoidal Salmonella isolated from children with bacteraemia in a rural district hospital Kenya. Int J Antimicrob Agents. 2006;28(3):166–71.<span class="Occurrences">
                          <span class="Occurrence OccurrenceDOI">
                            <a target="_blank" href="http://dx.doi.org/10.1016/j.ijantimicag.2006.05.026">
                              <span>
                                <span>View Article</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrencePID">
                            <a target="_blank" href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;dopt=Abstract&amp;list_uids=16904874">
                              <span>
                                <span>PubMed</span>
                              </span>
                            </a>
                          </span>
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Decreasing%20prevalence%20of%20antimicrobial%20resistance%20in%20non-typhoidal%20Salmonella%20isolated%20from%20children%20with%20bacteraemia%20in%20a%20rural%20district%20hospital%20Kenya&amp;author=S.%20Kariuki&amp;author=G.%20Revathi&amp;author=J.%20Kiiru&amp;author=B.%20Lowe&amp;author=JA.%20Berkley&amp;author=CA.%20Hart&amp;journal=Int%20J%20Antimicrob%20Agents&amp;volume=28&amp;issue=3&amp;pages=166-171&amp;publication_year=2006">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                    <li class="Citation">
                      <cite class="CitationContent" id="CR50">
                        DACA. Standard Treatment Guidline for General Hospitals. Addis Ababa: Drug Administration and Control Authority of Ethiopia; 2010.<span class="Occurrences">
                          <span class="Occurrence OccurrenceGS">
                            <a target="_blank" href="http://scholar.google.com/scholar_lookup?title=Standard%20Treatment%20Guidline%20for%20General%20Hospitals&amp;publication_year=2010">
                              <span>
                                <span>Google Scholar</span>
                              </span>
                            </a>
                          </span>
                        </span>
                      </cite>
                    </li>
                  </ol>
                </div>
              </section>
              <section xmlns="" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:meta="http://www.springer.com/app/meta" class="Section1 RenderAsSection1" id="CopyrightMessage">
                <h2 class="Heading js-ToggleCollapseSection">Copyright</h2>
                <div class="js-CollapseSection">
                  <div xmlns="http://www.w3.org/1999/xhtml" class="ArticleCopyright">©&nbsp;Eguale et al.&nbsp;2015</div>
                </div>
              </section>
            </div>



          </div>
        </div>
        <!--文章右边bar-->
        <div class="main__sidebar main__sidebar--right grid__col grid__col--xs-12 grid__col--md-3" id="main-sidebar">
          
        </div>
      </div>
    </div>
  </xsl:template> 
    
   
</xsl:stylesheet>