<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <xsl:output method="html" indent="yes" encoding="utf-8"/>


  <!--用来接收从外界传递过来的标题样式id-->
  <xsl:param name="titleStyleId"/>
  <!--用来接收从外界传递过来的作者信息html代码-->
  <xsl:param name="authorInfo"/>

  <!--用来接收从外界传递过来的单位信息html代码-->
  <xsl:param name="affiliationInfo"/>

  <!--获得所有的引用节点集，将节点集存入变量referencedata变量中-->
  <xsl:variable name="referencedata" select="//w:bookmarkStart[starts-with(@w:name,'_Ref')]" />

  <!--获得所有常规节点集-->
  <xsl:variable name="normalPara" select="/w:body/w:p[w:r/w:t][normalize-space(string-join(w:r/w:t,''))!='']" />

  <!--获取所有的普通节点集合-->
  <!--<xsl:variable name="commonPara" select="//w:p[w:r/w:t][not(w:pPr/w:pStyle)]" />-->
  <xsl:variable name="commonPara" select="/w:body/w:p[w:r/w:t][normalize-space(string-join(w:r/w:t,''))!=''][not(w:pPr/w:pStyle)]" />

  <!--获取所有的h3节点集合-->
  <xsl:variable name="h3Para" select="//w:p[w:pPr/w:pStyle[@w:val='3']]"/>


  <!--获取所有的h2节点集合-->
  <xsl:variable name="h2Para" select="/w:body/w:p[w:pPr/w:pStyle[@w:val='2']]"/>
  <!--***********************************获取Abstract节点,以及Abstract节点在全部非空节点中的索引,以及Abstract节点在全部H2节点中的索引  start***********************************-->
  <!--获取摘要节点-->
  <!--<xsl:variable name="abstractNode" select="/w:body/w:p[w:pPr/w:pStyle[@w:val='2']][lower-case(string-join(w:r/w:t,''))='abstract']"/>-->
  <xsl:variable name="abstractNode" select="$h2Para[lower-case(string-join(w:r/w:t,''))='abstract']"/>

  <!--获取Abstract节点在全部非空节点中的索引-->
  <xsl:variable name="abstractNodeIndex">
    <xsl:call-template name="getNodeIndex">
      <xsl:with-param name="nodes" select="$normalPara"/>
      <xsl:with-param name="node" select="$abstractNode"/>
    </xsl:call-template>
  </xsl:variable>

  <!--获取Abstract节点在全部H2节点中的索引-->
  <xsl:variable name="abstractNodeH2Index">
    <xsl:call-template name="getNodeIndex">
      <xsl:with-param name="nodes" select="$h2Para"/>
      <xsl:with-param name="node" select="$abstractNode"/>
    </xsl:call-template>
  </xsl:variable>

  <!--***********************************获取Abstract节点,以及Abstract节点在全部非空节点中的索引,以及Abstract节点在全部H2节点中的索引  end***********************************-->


  <!--获取 除去摘要节点 的所有H2节点-->
  <xsl:variable name="H2ExceptAbstract" select="$h2Para[lower-case(string-join(w:r/w:t,''))!='abstract']"/>

  <!--获取摘要节点之后第一个H2节点之后所有的H2,H3节点-->
  <!--$abstractNode/following-sibling::w:p[w:pPr/w:pStyle[@w:val='2']][1]获得Abstract节点之后的第一个H2节点-->
  <xsl:variable name="H3AndH2After2thH2" select="$abstractNode/following-sibling::w:p[w:pPr/w:pStyle[@w:val='2']][1]/following-sibling::w:p[w:pPr/w:pStyle[@w:val='2' or @w:val='3']]"/>




  <!--***********************************获取Reference节点,以及Reference节点在全部非空节点中的索引,以及Reference节点在全部H2节点中的索引  start***********************************-->
  <!--获取引用节点-->
  <xsl:variable name="referenceNode" select="$h2Para[lower-case(string-join(w:r/w:t,''))='references']"/>

  <!--获得引用节点在所有非空节点中的索引-->
  <xsl:variable name="referenceNodeIndex">
    <xsl:call-template name="getNodeIndex">
      <xsl:with-param name="nodes" select="$normalPara"/>
      <xsl:with-param name="node" select="$referenceNode"/>
    </xsl:call-template>
  </xsl:variable>

  <!--获得引用节点在所有H2节点中的索引-->
  <xsl:variable name="referenceNodeH2Index">
    <xsl:call-template name="getNodeIndex">
      <xsl:with-param name="nodes" select="$h2Para"/>
      <xsl:with-param name="node" select="$referenceNode"/>
    </xsl:call-template>
  </xsl:variable>
  <!--***********************************获取Reference节点,以及Reference节点在全部非空节点中的索引,以及Reference节点在全部H2节点中的索引  end***********************************-->

  <!--获得所有介于Abstract节点和Reference节点之间的H2节点-->
  <xsl:variable name="mainH2Nodes" select="$h2Para[position()>$abstractNodeH2Index and $referenceNodeH2Index>position()]"/>



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
              <xsl:value-of select="$authorInfo" disable-output-escaping="yes"/>

              <div class="ArticleHistory">

                Received:12 April 2015那一段没有写
              </div>
            </div>


            <!--正文不包括引用-->
            <div clsss="FulltextWrapper">
              <!--存放摘要部分-->
              *******************摘要部分*********************
              <xsl:call-template name="abstractPart"/>
              *******************摘要部分*********************
              <!--书写正文-->
              <xsl:call-template name="mainPart"/>
            </div>
            <!--隐藏部分 内容包括单位id,该单位id的单位内容，以及该单位的编号-->
            <xsl:value-of select="$affiliationInfo" disable-output-escaping="yes"/>

            <!--引用-->

            <div class="FulltextWrapper">
              <section xmlns="" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:meta="http://www.springer.com/app/meta" class="Section1 RenderAsSection1 SectionTypeMaterialsAndMethods" id="Bib1">
                <h2 class="Heading js-ToggleCollapseSection">References</h2>
                <div class="js-CollapseSection">
                  <ol class="BibliographyWrapper">





                    <xsl:apply-templates select="/w:body/w:p[w:bookmarkStart[starts-with(@w:name,'_Ref')]]"/>






                  </ol>
                </div>
              </section>
              <section xmlns="" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:meta="http://www.springer.com/app/meta" class="Section1 RenderAsSection1" id="CopyrightMessage">
                <h2 class="Heading js-ToggleCollapseSection">Copyright</h2>
                <div class="js-CollapseSection">
                  <div xmlns="http://www.w3.org/1999/xhtml" class="ArticleCopyright">尾部的垃圾版权</div>
                </div>
              </section>
            </div>

          </div>
        </div>
        <!--文章右边bar-->
        <div class="main__sidebar main__sidebar--right grid__col grid__col--xs-12 grid__col--md-3" id="main-sidebar">



          <div class="block">
            <aside role="complementary">
              <div class="SideBox">

                <p class="u-marginBtmM">
                  <a class="button button--size-300 button--priority-1 button--full" id="articlePdf" target="_blank" href="/track/pdf/10.1186/s12879-015-1235-y?site&#x3D;bmcinfectdis.biomedcentral.com" data-track-event="click" data-event-category="PDF Download"
                     data-event-action="Click download article PDF"
                     data-event-label="10.1186/s12879-015-1235-y">Download PDF</a>
                </p>


              </div>
              <div class="SideBox">
                <nav xmlns="" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:meta="http://www.springer.com/app/meta" id="ArticleNavigation" class="table-of-contents" aria-label="table of contents">
                  <div class="table-of-contents__content" data-sticky="toc">
                    <h3 class="table-of-contents__title is-active" data-toggle="collapse" data-target="tocMenu" data-event-category="Table of Contents" data-track-event="click" data-event-action="Toggle ToC" data-event-label="Toggle">Table of Contents</h3>
                    <ul class="table-of-contents__menu is-open" role="menu" id="tocMenu">


                      <!--将样式为标题2(h2)的弄成导航-->
                      <!--<xsl:apply-templates select="//w:p[w:pPr/w:pStyle[@w:val=2] and w:r[w:t='Abstract']]" mode="AbsDaohang" />-->

                      <xsl:apply-templates select="//w:p[w:pPr/w:pStyle[@w:val='2']]" mode="Daohang"/>

                      <li role="menuitem" class="table-of-contents__item is-hidden">
                        <a class="table-of-contents__link" href="#comments" data-event-category="Table of Contents" data-track-event="click" data-event-action="Link Clicked" data-event-label="Comments">Comments</a>
                      </li>


                    </ul>
                  </div>
                </nav>
              </div>
              <div class="SideBox">
                <h3 class="SideBox_title">Metrics</h3>
                <ul class="SideBox_list list-stacked list-stacked--small list-stacked--2">
                  <div id="article-access-count-loader" class="placeholder" data-replace="true" data-placeholder="/placeholder/v1/article/access-count/10.1186/s12879-015-1235-y #accessCount-container"></div>
                  <div id="citation-count-loader" class="placeholder" data-replace="true" data-placeholder="/placeholder/v1/article/citation-count/10.1186/s12879-015-1235-y #count-container"></div>
                  <div id="altmetric-loader" class="placeholder" data-replace="true" data-placeholder="/placeholder/v1/article/altmetric/10.1186/s12879-015-1235-y #altmetric-container"></div>
                </ul>
              </div>

              <div id="sociaMediaShare" class="SideBox">
                <h3 class="SideBox_title">Share this article</h3>
                <ul id="shareButtons" class="share">
                  <li class="share__item">
                    <button id="shareOnTwitter" class="js-btnShareOnTwitter share__button share__button--twitter" data-track-event="click"
                            data-event-category="Article Page" data-event-action="Share Twitter" data-event-label="10.1186/s12879-015-1235-y">
                      <span class="u-srOnly">Share on Twitter</span>
                    </button>
                  </li>
                  <li class="share__item">
                    <button id="shareOnFacebook" class="js-btnShareOnFacebook share__button share__button--facebook" data-track-event="click"
                            data-event-category="Article Page" data-event-action="Share Facebook" data-event-label="10.1186/s12879-015-1235-y">
                      <span class="u-srOnly">Share on Facebook</span>
                    </button>
                  </li>
                  <li class="share__item">
                    <button id="shareOnLinkedIn" class="js-btnShareOnLinkedIn share__button share__button--linkedin" data-track-event="click"
                            data-event-category="Article Page" data-event-action="Share LinkedIn" data-event-label="10.1186/s12879-015-1235-y">
                      <span class="u-srOnly">Share on LinkedIn</span>
                    </button>
                  </li>
                  <li class="share__item">
                    <button id="shareOnWeibo" class="js-btnShareOnWeibo share__button share__button--weibo" data-track-event="click"
                            data-event-category="Article Page" data-event-action="Share Weibo" data-event-label="10.1186/s12879-015-1235-y">
                      <span class="u-srOnly">Share on Weibo</span>
                    </button>
                  </li>
                  <li class="share__item">
                    <button id="shareOnGooglePlus" class="js-btnShareOnGplus share__button share__button--gplus" data-track-event="click"
                            data-event-category="Article Page" data-event-action="Share Google+" data-event-label="10.1186/s12879-015-1235-y">
                      <span class="u-srOnly">Share on Google Plus</span>
                    </button>
                  </li>
                  <li class="share__item">
                    <button id="shareOnReddit" class="js-btnShareOnReddit share__button share__button--reddit" data-track-event="click"
                            data-event-category="Article Page" data-event-action="Share Reddit" data-event-label="10.1186/s12879-015-1235-y">
                      <span class="u-srOnly">Share on Reddit</span>
                    </button>
                  </li>
                </ul>
              </div>



              <div class="SideBox">
                <h3 class="SideBox_title">See updates</h3>
                <a data-crossmark="10.1186/s12879-015-1235-y" rel="modal:open" href="#crossmark-dialog" data-track-event="click" data-event-category="Article Page" data-event-action="Click CrossMark" data-event-label="10.1186/s12879-015-1235-y">
                  <img class="CrossMark" id="crossmark-icon" src="/static/images/crossmark.541e56be.png" alt="Click to get updates and verify authenticity" />
                </a>
                <div id="crossmark-dialog" class="u-isHidden">
                  <iframe id="crossmark-iframe" frameborder="0" width="550" height="550"></iframe>
                </div>
                <div class="Modal" data-modal="wrap">
                  <div class="Modal_inner">
                    <a rel="modal:close" id="close-10.1186/s12879-015-1235-y" class="Icon Icon--cross-default"></a>
                    <div class="Modal_content" data-modal="content"></div>
                  </div>
                </div>
              </div>




              <div id="articleSections" class="SideBox">
                <h3 class="SideBox_title">Section</h3>
                <ul class="list-stacked list-stacked--2 list-stacked--small">

                  <li class="list-stacked__item">
                    <a class="list-stacked__link" href="/articles/sections/bacterial-and-fungal-diseases"
                       data-track-event="click"
                       data-event-category="Article Page"
                       data-event-action="Click section link"
                       data-event-label="10.1186/s12879-015-1235-y">Bacterial and fungal diseases</a>
                  </li>

                </ul>
              </div>


              <div class="SideBox">
                <h3 class="SideBox_title">Other Actions</h3>
                <ul class="list-stacked list-stacked--2 list-stacked--small">
                  <li class="list-stacked__item">

                    <a data-track-event="click" data-event-category="Article Page" data-event-action="Order article reprints" data-event-label="10.1186/s12879-015-1235-y" href="#">Order reprint</a>

                  </li>
                </ul>
              </div>


              <div id="sociaMediaAccounts" class="SideBox">
                <h3 class="SideBox_title">Follow</h3>
                <ul class="follow follow--inline">

                  <li class="follow__item">
                    <a class="follow__link follow__link--twitter-2" href="https://twitter.com/BMC_series" data-track-event="click" data-event-category="Social Media"
                       data-event-action="Click Follow Social Media" data-event-label="Twitter">
                      <span class="follow__label">Follow us on Twitter</span>
                    </a>
                  </li>


                </ul>
              </div>


            </aside>

            <div id="FulltextAd" class="adsbox Ad Ad--skyscraper">
              <div class="Ad_content">
                <p class="Ad_label">Advertisement</p>
                <span id="pbgrd-43415139"></span>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>
  </xsl:template>

  <!--**************************************************导航**************************************************-->
  <xsl:template match="//w:p[w:pPr/w:pStyle[@w:val='2']]" mode="Daohang">
    <xsl:if test="w:r[w:t='Abstract']">
      <li role="menuitem" class="table-of-contents__item">
        <a class="table-of-contents__link" href="#Abs1" data-event-category="Table of Contents" data-track-event="click" data-event-action="Link Clicked" data-event-label="Abstract">
          <xsl:value-of select="."/>
        </a>
      </li>

    </xsl:if>
    <li role="menuitem" class="table-of-contents__item">
      <a class="table-of-contents__link" href="#Abs1" data-event-category="Table of Contents" data-track-event="click" data-event-action="Link Clicked" data-event-label="Abstract">
        <xsl:value-of select="."/>
      </a>
    </li>
  </xsl:template>

  <!--摘要最顶端-->
  <xsl:template match="//w:p[w:pPr/w:pStyle[@w:val='2'] and w:r/w:t='Abstract']">
    <section xmlns="" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:meta="http://www.springer.com/app/meta" class="Abstract" id="Abs1" lang="en">
      <h2 class="Heading js-ToggleCollapseSection">Abstract</h2>
      <div class="js-CollapseSection">


      </div>
    </section>
  </xsl:template>


  <!--***********************************************************获取两个节点之间节点***********************************************************-->
  <xsl:template name="findNodes">
    <xsl:param name="source"/>
    <xsl:param name="nodeName"/>
    <xsl:param name="startIndex"/>
    <xsl:param name="endIndex"/>
    <xsl:variable name="startNode" select="$source/*[name()=$nodeName][$startIndex]"/>
    <xsl:variable name="endNode" select="$source/*[name()=$nodeName][$endIndex]"/>

    <xsl:variable name="resultNodeStartIndex">
      <xsl:call-template name="getNodeIndex">
        <xsl:with-param name="nodes" select="$source/*" />

        <xsl:with-param name="node" select="$startNode"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="resultNodeEndIndex">
      <xsl:call-template name="getNodeIndex">
        <xsl:with-param name="nodes" select="$source/*" />
        <xsl:with-param name="node" select="$endNode" />
      </xsl:call-template>
    </xsl:variable>
     
    <xsl:for-each select="$source/*[position() > $resultNodeStartIndex and position() &lt; $resultNodeEndIndex]">
      <xsl:copy-of select="."/>
    </xsl:for-each>

  </xsl:template>

  <xsl:template name="getNodeIndex">
    <xsl:param name="nodes"/>
    <xsl:param name="node"/>
    <xsl:for-each select="$nodes">
      <xsl:choose>
        <xsl:when test=". is $node">
          <xsl:value-of select="position()"/>
        </xsl:when>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  <!--***********************************************************获取两个节点之间节点***********************************************************-->


  <!--***********************************************************1摘要部分 被Html使用了***********************************************************-->
  <xsl:template name="abstractPart">
    <!--获取摘要节点的下一个H2节点-->
    <xsl:variable name="firstH2AfterAbstract" select="$abstractNode/following-sibling::w:p[w:pPr/w:pStyle[@w:val='2']][position()=1]"/>

    <!--获取Abstract节点在全文所有非空段落节点中的位置-->
    <!--
    <xsl:variable name="resultNodeStartIndex">
      <xsl:call-template name="getNodeIndex">
        <xsl:with-param name="nodes" select="$normalPara"/>
        <xsl:with-param name="node" select="$abstractNode"/>
      </xsl:call-template>
    </xsl:variable>-->

    <!--获取Abstract节点的下一个节点在全文所有非空段落节点中的位置-->
    <xsl:variable name="resultNodeEndIndex">
      <xsl:call-template name="getNodeIndex">
        <xsl:with-param name="nodes" select="$normalPara"/>
        <xsl:with-param name="node" select="$firstH2AfterAbstract"/>
      </xsl:call-template>
    </xsl:variable>

    <!--获取摘要节点的下一个H3节点-->
    <xsl:variable name="firstH3AfterAbstract" select="$abstractNode/following-sibling::w:p[w:pPr/w:pStyle[@w:val='3']][position()=1]"/>


    <section xmlns="" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:meta="http://www.springer.com/app/meta" class="Abstract" id="Abs1" lang="en">
      <h2 class="Heading js-ToggleCollapseSection">Abstract</h2>
      <div class="js-CollapseSection">
        <xsl:choose>
          <!--如果在两个H2节点之间不存在H3节点-->
          <xsl:when test="not($firstH3AfterAbstract)">
            <xsl:call-template name="paragraphWithoutH3BeforeHtml">
              <xsl:with-param name="startIndex" select="$abstractNodeIndex" />
              <xsl:with-param name="endIndex" select="$resultNodeEndIndex" />
            </xsl:call-template>
          </xsl:when>
          <!--如果第一个H3节点是关键词节点-->
          <xsl:when test="lower-case($firstH3AfterAbstract/string-join(w:r/w:t,''))='keywords'">
            <xsl:call-template name="firstH3IsKeywordsHtml">
              <xsl:with-param name="startIndex" select="$abstractNodeIndex"/>
              <xsl:with-param name="endIndex" select="$firstH2AfterAbstract"/>
              <xsl:with-param name="KeywordsNode" select="$firstH3AfterAbstract"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <!--获取关键词节点-->
            <xsl:variable name="NodeKeywords" select="/w:body/w:p[lower-case(string-join(w:r/w:t,''))='keywords']"/>
            <xsl:variable name="NodeKeywordsIndex">
              <xsl:call-template name="getNodeIndex">
                <xsl:with-param name="nodes" select="$normalPara"/>
                <xsl:with-param name="node" select="$NodeKeywords"/>
              </xsl:call-template>
            </xsl:variable>

            <xsl:variable name="firstH3AfterAbstractIndex">
              <xsl:call-template name="getNodeIndex">
                <xsl:with-param name="nodes" select="$normalPara"/>
                <xsl:with-param name="node" select="$firstH3AfterAbstract"/>
              </xsl:call-template>
            </xsl:variable>
            <xsl:call-template name="H3InAbstract">
              <xsl:with-param name="startIndex" select="$firstH3AfterAbstractIndex"/>
              <xsl:with-param name="endIndex" select="$NodeKeywordsIndex"/>
            </xsl:call-template>

            <xsl:call-template name="KeywordsPart">
              <xsl:with-param name="NodeKeywords" select="$NodeKeywords"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </div>
    </section>

  </xsl:template>
  <!--***********************************************************1摘要部分 被Html使用了***********************************************************-->

  <!--***********************************************************正文部分  2 被Html使用了***********************************************************-->
  <xsl:template name="mainPart">
    <xsl:for-each select="$mainH2Nodes">
      <!--H2ExceptAbstract-->

      <!--当前节点在全文所有非空段落节点中的位置-->

      <xsl:variable name="resultNodeStartIndex">
        <xsl:call-template name="getNodeIndex">
          <xsl:with-param name="nodes" select="$normalPara"/>
          <xsl:with-param name="node" select="."/>
        </xsl:call-template>
      </xsl:variable>

      <!--获取下一个H2节点-->
      <xsl:variable name="NextH2Node" select="following-sibling::w:p[w:pPr/w:pStyle[@w:val='2']][position()=1]"/>


      <section xmlns="" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:meta="http://www.springer.com/app/meta" id="{concat('Sec',position())}" class="Section1 RenderAsSection1">
        <h2 class="Heading js-ToggleCollapseSection">
          <xsl:value-of select="."/>
        </h2>
        <div class="js-CollapseSection">
          <xsl:choose>
            <!--当存在下一个H2节点的时候-->
            <xsl:when test="$NextH2Node">
              <!--获得下一个H2的索引-->

              <xsl:variable name="resultNodeEndIndex">
                <xsl:call-template name="getNodeIndex">
                  <xsl:with-param name="nodes" select="$normalPara"/>
                  <xsl:with-param name="node" select="$NextH2Node"/>
                </xsl:call-template>
              </xsl:variable>
              <!--获得当前H2和下一个H2之间的第一个H3-->
              <xsl:variable name="firstH3AfterH2a" select="$normalPara[position()>number($resultNodeStartIndex) and number($resultNodeEndIndex)>position()][w:pPr/w:pStyle[@w:val='3']][1]"/>
              <xsl:choose>

                <!--当两个H2之间不存在H3的时候直接输出普通段落-->

                <xsl:when test="not($firstH3AfterH2a)">
                  <xsl:call-template name="paragraphWithoutH3BeforeHtml">
                    <xsl:with-param name="startIndex" select="$resultNodeStartIndex"/>
                    <xsl:with-param name="endIndex" select="$resultNodeEndIndex"/>
                  </xsl:call-template>
                </xsl:when>
                <!--当两个H2之间存在H3时-->

                <xsl:otherwise>
                  <!--首先判断H3和H2之间是否存在普通段落-->
                  <xsl:variable name="firstH3AfterH2aIndex">
                    <xsl:call-template name="getNodeIndex">
                      <xsl:with-param name="nodes" select="$normalPara"/>
                      <xsl:with-param name="node" select="$firstH3AfterH2a"/>
                    </xsl:call-template>
                  </xsl:variable>

                  <!--获得H2之后下一个H2在所有非空段落的索引值-->
                  <xsl:variable name="NextH2NodeIndex">
                    <xsl:call-template name="getNodeIndex">
                      <xsl:with-param name="nodes" select="$normalPara"/>
                      <xsl:with-param name="node" select="$NextH2Node"/>
                    </xsl:call-template>
                  </xsl:variable>
                  <!--如果H3和他上面的H2之间的差大于1说明，二者之间有普通的段落-->
                  <xsl:if test="number($firstH3AfterH2aIndex)-number($resultNodeStartIndex)>1">
                    <xsl:call-template name="paragraphWithoutH3BeforeHtml">
                      <xsl:with-param name="startIndex" select="$resultNodeStartIndex"/>
                      <xsl:with-param name="endIndex" select="$firstH3AfterH2aIndex"/>
                    </xsl:call-template>
                  </xsl:if>
                  <!--调用H3InH2模板-->
                  <xsl:call-template name="H3InH2">
                    <xsl:with-param name="startIndex" select="$firstH3AfterH2aIndex"/>
                    <xsl:with-param name="endIndex" select="$NextH2NodeIndex"/>
                  </xsl:call-template>

                </xsl:otherwise>

              </xsl:choose>

            </xsl:when>
            <!--引用之前最后一个H2-->
            <xsl:otherwise>
              <!--获得最后一个H2和References节点之间的 第一个H3节点-->
              <xsl:variable name="firstH3AfterH2b" select="$normalPara[position()>number($resultNodeStartIndex) and number($referenceNodeIndex)>position()][w:pPr/w:pStyle[@w:val='3']][1]"/>


              <xsl:choose>

                <!--当不存在H3的时候直接输出普通段落-->
                <xsl:when test="not($firstH3AfterH2b)">
                  <xsl:call-template name="paragraphWithoutH3BeforeHtml">
                    <xsl:with-param name="startIndex" select="$resultNodeStartIndex"/>
                    <xsl:with-param name="endIndex" select="$referenceNodeIndex"/>
                  </xsl:call-template>
                </xsl:when>
                <!--当存在H3时-->
                <xsl:otherwise>
                  <!--首先判断H3和H2之间是否存在普通段落-->
                  <xsl:variable name="firstH3AfterH2bIndex">
                    <xsl:call-template name="getNodeIndex">
                      <xsl:with-param name="nodes" select="$normalPara"/>
                      <xsl:with-param name="node" select="$firstH3AfterH2b"/>
                    </xsl:call-template>
                  </xsl:variable>

                  <!--如果H3和他上面的H2之间的差大于1说明，二者之间有普通的段落-->
                  <xsl:if test="number($firstH3AfterH2bIndex)-number($resultNodeStartIndex)>1">
                    <xsl:call-template name="paragraphWithoutH3BeforeHtml">
                      <xsl:with-param name="startIndex" select="$resultNodeStartIndex"/>
                      <xsl:with-param name="endIndex" select="$firstH3AfterH2bIndex"/>
                    </xsl:call-template>
                  </xsl:if>
                  <!--调用H3InH2模板-->
                  <xsl:call-template name="H3InH2">
                    <xsl:with-param name="startIndex" select="$firstH3AfterH2bIndex"/>
                    <xsl:with-param name="endIndex" select="$referenceNodeIndex"/>
                  </xsl:call-template>

                </xsl:otherwise>

              </xsl:choose>


            </xsl:otherwise>


          </xsl:choose>


        </div>
      </section>

    </xsl:for-each>


  </xsl:template>
  <!--***********************************************************正文部分  2 被Html使用了***********************************************************-->



  <!--*******************************a上面没有h3节点的普通段落形成的Html  被1使用过*******************************-->
  <xsl:template name="paragraphWithoutH3BeforeHtml">
    <xsl:param name="startIndex"/>
    <xsl:param name="endIndex"/>
    <xsl:for-each select="$normalPara[position() &gt;$startIndex and position() &lt;$endIndex]">
      <p xmlns="http://www.w3.org/1999/xhtml" id="{concat('Para',position())}" class="Para">


        <xsl:call-template name="commonParaOutPut">
          <xsl:with-param name="comPara" select="."/>
        </xsl:call-template>
        <!--<xsl:value-of select="."/>-->
      </p>
    </xsl:for-each>
  </xsl:template>
  <!--*******************************a上面没有h3节点的普通段落形成的Html  被1使用过*******************************-->

  <!--*******************************普通段落的输出,特别是要处理引用*******************************-->

  <!--普通段落输出模板-->
  <xsl:template name="commonParaOutPut">
    <xsl:param name="comPara"/>
    <!--第一道过滤-->
    <!--将传进来的段落里面 instrText值为空的节点去掉-->
    <xsl:variable name="comPara_After_instrText_Clear">
      <xsl:call-template name="comPara_instrTextNull_Clear">
        <xsl:with-param name="comPara" select="$comPara"/>
      </xsl:call-template>
    </xsl:variable>
    
    <!--第二道过滤-->
    <xsl:call-template name="comPara_Ref_Operate">
      <xsl:with-param name="compara" select="$comPara"/>
    </xsl:call-template>

  </xsl:template>

  <!--*普通段落第一道过滤 将传进来的段落中 instrText为空的节点去掉*-->
  <xsl:template name="comPara_instrTextNull_Clear">
    <xsl:param name="comPara"/>
    <xsl:variable name="comPara_instrTextNull" select="$comPara/w:r[normalize-space(w:instrText)='']"/>
    <xsl:for-each select="$comPara/w:r">
      <xsl:variable name="currentNode" select="."/>
      <xsl:for-each select="$comPara_instrTextNull">
        <xsl:if test="not($currentNode is .)">
          <xsl:copy-of select="$currentNode"/>
        </xsl:if>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>
  <!--*普通段落第一道过滤 将传进来的段落中 instrText为空的节点去掉*-->

  <!--**普通段落第二道过滤 将传进来的段落 引用部分进行修改**-->
  <xsl:template name="comPara_Ref_Operate">
    <xsl:param name="compara"/>
    <xsl:variable name="wr_instrText_Ref" select="$compara/w:r[starts-with(normalize-space(w:instrText),'REF')]"/>
    <xsl:choose>
      <xsl:when test="count($wr_instrText_Ref)=0">
        <xsl:copy-of select="."/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="end" select="0"/>
        
        <xsl:for-each select="1 to count($wr_instrText_Ref)">
          <xsl:variable name="index" select="."/>
          <!--<xsl:value-of select="count($wr_instrText_Ref)"/>-->
          <!--获取当前instrText节点的索引-->
          <xsl:variable name="wr_instrText_Index">
            <xsl:call-template name="getNodeIndex">
              <xsl:with-param name="nodes" select="$compara/w:r"/>
              <xsl:with-param name="node" select="$wr_instrText_Ref[$index]"/>
            </xsl:call-template>
          </xsl:variable>

          <!--获取索引所对应的引用节点的3个关键节点-->
          <xsl:variable name="wr_fldCharBegin" select="$wr_instrText_Ref[$index]/preceding-sibling::w:r[w:fldChar/@w:fldCharType='begin'][1]"/>
          <xsl:variable name="wr_fldCharSeparate" select="$wr_instrText_Ref[$index]/following-sibling::w:r[w:fldChar/@w:fldCharType='separate'][1]"/>
          <xsl:variable name="wr_fldCharEnd" select="$wr_instrText_Ref[$index]/following-sibling::w:r[w:fldChar/@w:fldCharType='end'][1]"/>

          <!--获取3个关键节点所对应的在该段落中的索引-->
          <xsl:variable name="wr_fldCharBegin_Index">
            <xsl:call-template name="getNodeIndex">
              <xsl:with-param name="nodes" select="$compara/w:r"/>
              <xsl:with-param name="node" select="$wr_fldCharBegin"/>
            </xsl:call-template>
          </xsl:variable>


          <xsl:variable name="wr_fldCharSeparate_Index">
            <xsl:call-template name="getNodeIndex">
              <xsl:with-param name="nodes" select="$compara/w:r"/>
              <xsl:with-param name="node" select="$wr_fldCharSeparate"/>
            </xsl:call-template>
          </xsl:variable>

          <xsl:variable name="wr_fldCharEnd_Index">
            <xsl:call-template name="getNodeIndex">
              <xsl:with-param name="nodes" select="$compara/w:r"/>
              <xsl:with-param name="node" select="$wr_fldCharEnd"/>
            </xsl:call-template>
          </xsl:variable>
          
          
          <xsl:choose>
            <xsl:when test="$compara/w:r[number($wr_instrText_Index)] is $wr_instrText_Ref[1]">
              <xsl:for-each select="$compara/w:r[position()>=1 and number($wr_fldCharBegin_Index)>position()]">
                <xsl:copy-of  select="."/>
              </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
              <!--获取之前一个instrText节点后面第一个end的索引-->
              <xsl:variable name="pre_wr_instrText" select="$wr_instrText_Ref[number($index)-1]"/>
              <xsl:variable name="pre_wr_fldCharEnd" select="$pre_wr_instrText/following-sibling::w:r[w:fldChar/@w:fldCharType='end'][1]"/>
              <xsl:variable name="pre_wr_fldCharEnd_Index">
                <xsl:call-template name="getNodeIndex">
                  <xsl:with-param name="nodes" select="$compara/w:r"/>
                  <xsl:with-param name="node" select="$pre_wr_fldCharEnd"/>
                </xsl:call-template>
              </xsl:variable>
              <xsl:for-each select="$compara/w:r[position()>number($pre_wr_fldCharEnd_Index) and number($wr_fldCharBegin_Index)>position()]">
                <xsl:copy-of select="."/>
              </xsl:for-each>
            </xsl:otherwise>
          </xsl:choose>
          <!--如果这instrText节点是最后一个instrText引用节点-->
          <w:r>
            <w:t>
              <a href="#">
                <xsl:value-of select="$compara/w:r[position()>number($wr_fldCharSeparate_Index) and number($wr_fldCharEnd_Index)>position()]"/>
              </a>
            </w:t>
          </w:r>
          
          <xsl:if test="$compara/w:r[number($wr_instrText_Index)] is $wr_instrText_Ref[last()]">
            <xsl:for-each select="$compara/w:r[position()>number($wr_fldCharEnd_Index)]">
              <xsl:copy-of select="."/>
            </xsl:for-each>
          </xsl:if>
          
          

        </xsl:for-each>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!--*******************************普通段落的输出,特别是要处理引用*******************************-->


  <!--*******************************上面没有h3节点的普通段落形成的Html  被1使用过*******************************-->



  <!--****************************************************H2之下的内容 H3以及H3下面的普通段落的组合  被1使用了****************************************************-->
  <!--获取在Abstract下方的H3-->
  <xsl:template name="H3InH2">

    <!--起始节点索引，H2下第一个H3节点-->
    <xsl:param name="startIndex"/>
    <!--终了节点索引，下一个H2节点-->
    <xsl:param name="endIndex"/>

    <xsl:variable name="H3BetweenH2" select="$normalPara[position()>=number($startIndex) and number($endIndex)>position()][w:pPr/w:pStyle[@w:val='3']]"/>
    <xsl:for-each select="$H3BetweenH2">

      <xsl:variable name="currentH3Position">
        <xsl:call-template name="getNodeIndex">
          <xsl:with-param name="nodes" select="$H3AndH2After2thH2"/>
          <xsl:with-param name="node" select="."/>
        </xsl:call-template>
      </xsl:variable>
      <section id="{concat('Sec',string(number($currentH3Position)+1))}" class="Section2 RenderAsSection2">
        <h3 class="Heading">
          <xsl:value-of select="."/>
        </h3>
        <xsl:call-template name="commonParaAfterH3">
          <xsl:with-param name="startNode" select="."/>
        </xsl:call-template>
      </section>
    </xsl:for-each>

  </xsl:template>
  <!--****************************************************H2之下的内容 H3以及H3下面的普通段落的组合  被1使用了****************************************************-->




  <!--****************************************************Abstract之下的内容 H3以及H3下面的普通段落的组合  被1使用了 start****************************************************-->
  <!--获取在Abstract下方的H3-->
  <xsl:template name="H3InAbstract">

    <!--起始节点索引，Abstract下第一个H3节点-->
    <xsl:param name="startIndex"/>
    <!--终了节点索引,Keywords节点-->
    <xsl:param name="endIndex"/>

    <!--这块儿没写全，应该加上一个判断在第一个H3和Abstract之间是否有普通段落-->

    <!--/w:p[position()>=$startIndex and $endIndex>position()] 因为startIndex是第一个H3节点的索引 所以这里用到>=,而endIndex是Keywords所以这里没有等于-->
    <xsl:variable name="H3BetweenAbstractAndKeywords" select="$normalPara[position()>=number($startIndex) and number($endIndex)>position()][w:pPr/w:pStyle[@w:val='3']]"/>
    <xsl:for-each select="$H3BetweenAbstractAndKeywords">
      <div xmlns="http://www.w3.org/1999/xhtml" class="AbstractSection" id="{concat('ASec',position())}">
        <xsl:call-template name="commonParaAfterH3">
          <xsl:with-param name="startNode" select="."/>
        </xsl:call-template>
      </div>
    </xsl:for-each>

  </xsl:template>
  <!--****************************************************Abstract之下的内容 H3以及H3下面的普通段落的组合  被1使用了  end****************************************************-->

  <!--****************************************************获得H3之后的普通段落，将这些段落放在P之中  start****************************************************-->
  <xsl:template name="commonParaAfterH3">
    <!--当前H3节点-->
    <xsl:param name="startNode"/>
    <xsl:variable name="startIndex">
      <xsl:call-template name="getNodeIndex">
        <xsl:with-param name="nodes" select="$normalPara"/>
        <xsl:with-param name="node" select="$startNode"/>
      </xsl:call-template>
    </xsl:variable>
    <!--获取当前H3节点之后的下一个H2或者H3节点-->
    <xsl:variable name="endNode" select="$startNode/following-sibling::w:p[w:pPr/w:pStyle[@w:val='3' or @w:val='2']][1]"/>
    <!--如果节点存在-->
    <xsl:if test="$endNode">
      <xsl:variable name="endIndex">
        <xsl:call-template name="getNodeIndex">
          <xsl:with-param name="nodes" select="$normalPara"/>
          <xsl:with-param name="node" select="$endNode"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="commonParas1" select="$normalPara[position()>$startIndex and $endIndex>position()]"/>
      <xsl:for-each select="$commonParas1">
        <!--获得当前段落节点在非空的普通段落中的位置-->
        <xsl:variable name="currentNodePosition">
          <xsl:call-template name="getNodeIndex">
            <xsl:with-param name="nodes" select="$commonPara"/>
            <xsl:with-param name="node" select="."/>
          </xsl:call-template>
        </xsl:variable>
        <p id="{concat('Para',$currentNodePosition)}" class="Para">



          <xsl:call-template name="commonParaOutPut">
            <xsl:with-param name="comPara" select="."/>
          </xsl:call-template>





        </p>
      </xsl:for-each>
    </xsl:if>
    <!--如果H3节点之后没有H3节点或者H2节点-->
    <xsl:if test="not($endNode)">
      <xsl:variable name="commonParas2" select="$normalPara[position()>$startIndex]"/>
      <xsl:for-each select="$commonParas2">
        <!--获得当前段落节点在非空的普通段落中的位置-->
        <xsl:variable name="currentNodePosition">
          <xsl:call-template name="getNodeIndex">
            <xsl:with-param name="nodes" select="$commonPara"/>
            <xsl:with-param name="node" select="."/>
          </xsl:call-template>
        </xsl:variable>
        <p id="{concat('Para',$currentNodePosition)}" class="Para">


          <xsl:call-template name="commonParaOutPut">
            <xsl:with-param name="comPara" select="."/>
          </xsl:call-template>


        </p>
      </xsl:for-each>
    </xsl:if>

  </xsl:template>
  <!--****************************************************获得H3之后的普通段落，将这些段落放在P之中  end****************************************************-->



  <!--****************************************************关键词****************************************************-->
  <xsl:template name="KeywordsPart">
    <xsl:param name="NodeKeywords"/>
    <div xmlns="http://www.w3.org/1999/xhtml" class="KeywordGroup" lang="en">
      <h3 xmlns="" class="Heading">Keywords</h3>
      <xsl:variable name="keywordsContent" select="normalize-space(string-join($NodeKeywords/following-sibling::w:p[1]/w:r/w:t,''))"/>
      <xsl:call-template name="output-tokens">
        <xsl:with-param name="list" select="$keywordsContent"/>
        <xsl:with-param name="separator" select="','"/>
      </xsl:call-template>
    </div>
  </xsl:template>
  <!--****************************************************关键词****************************************************-->

  <!--****************************************************b摘要内第一个H3标签是关键词的时候 在1中被使用过 start****************************************************-->
  <xsl:template name="firstH3IsKeywordsHtml">
    <xsl:param name="startIndex"/>
    <xsl:param name="endIndex"/>
    <!--将关键词节点传递过来，注意这里的前提是关键词节点是第一个H3节点-->
    <xsl:param name="KeywordsNode"/>
    <!--获得关键词节点在所有非空段落节点中的位置-->
    <xsl:variable name="KeywordsIndex">
      <xsl:call-template name="getNodeIndex">
        <xsl:with-param name="nodes" select="$normalPara"/>
        <xsl:with-param name="node" select="$KeywordsNode"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="number($KeywordsIndex)-number($startIndex)>1">
      <xsl:call-template name="paragraphWithoutH3BeforeHtml">
        <xsl:with-param name="startIndex" select="$startIndex"/>
        <xsl:with-param name="endIndex" select="$KeywordsIndex"/>
      </xsl:call-template>
    </xsl:if>

    <xsl:call-template name="KeywordsPart">
      <xsl:with-param name="NodeKeywords" select="$KeywordsNode"/>
    </xsl:call-template>
  </xsl:template>
  <!--****************************************************b摘要内第一个H3标签是关键词的时候 在1中被使用过 end****************************************************-->


  <!--****************************************************将关键词分割好的递归，供给关键词部分使用****************************************************-->
  <xsl:template name="output-tokens">
    <xsl:param name="list"/>
    <xsl:param name="separator"/>
    <xsl:variable name="newlist" select="concat(normalize-space($list),$separator)"/>
    <xsl:variable name="first" select="substring-before($newlist,$separator)"/>
    <xsl:variable name="remaining" select="substring-after($newlist,$separator)"/>

    <span class="Keyword">
      <!--奇怪的是这个地方会出现 xmlns=""-->
      <xsl:value-of select="$first"/>
    </span>

    <xsl:if test="substring-before($remaining,$separator)!=''">
      <xsl:call-template name="output-tokens">
        <xsl:with-param name="list" select="$remaining"/>
        <xsl:with-param name="separator" select="$separator"/>
      </xsl:call-template>
    </xsl:if>

  </xsl:template>

  <!--****************************************************将关键词分割好的递归，供给关键词部分使用****************************************************-->

  <xsl:template name="H3">
    <xsl:param name="startIndex"/>
    <xsl:param name="endIndex"/>
    <xsl:param name="FirstH3Node"/>

    <xsl:variable name="FirstH3NodeIndex">
      <xsl:call-template name="getNodeIndex">
        <xsl:with-param name="nodes" select="$normalPara"/>
        <xsl:with-param name="node" select="$FirstH3Node"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:if test="number($FirstH3NodeIndex)-number($startIndex)>1">
      <xsl:call-template name="paragraphWithoutH3BeforeHtml">
        <xsl:with-param name="startIndex" select="$startIndex"/>
        <xsl:with-param name="endIndex" select="$FirstH3NodeIndex"/>
      </xsl:call-template>
    </xsl:if>

  </xsl:template>






  <!--下面这段xPath是一段很复杂的xpath
  //w:p[w:pPr/w:pStyle[@w:val=3]] 从根节点选择所有的样式为3的段落
  [preceding-sibling::w:p[w:pPr/w:pStyle[@w:val=2]] 限定谓语 preceding-sibling::w:p代表上下文节点的前面的w:p兄弟节点 [w:pPr/w:pStyle[@w:val=2] 前面兄弟节点样式为2的节点
  继承上述  [position()=1] 代表当前上下文节点中 前面兄弟节点中样式为2的 第一个
  继承上述  [w:r/w:t='Abstract'] 并且要求这个第一个样式为2的前面兄弟节点的 w:t为Abstract
  -->
  <xsl:template match="//w:p[w:pPr/w:pStyle[@w:val='3']][preceding-sibling::w:p[w:pPr/w:pStyle[@w:val='2']][position()=1][w:r/w:t='Abstract']]" mode="dog">
    <!--(A-H3)-->

    <!--<div xmlns="http://www.w3.org/1999/xhtml" class="AbstractSection" id="ASec{position()}">-->
    开头<xsl:value-of select='"&lt;div" ' disable-output-escaping='yes'/> class="AbstractSection" <xsl:text>id="ASec{position()}"</xsl:text> <xsl:value-of select='"&gt;"' disable-output-escaping='yes'/>
    <h3 xmlns="" class="Heading">
      <xsl:value-of select="."/>
    </h3>

  </xsl:template>

  <xsl:template match="//w:p[not(w:pPr/w:pStyle)][preceding-sibling::w:p[w:pPr/w:pStyle[@w:val='2']][position()=1][w:r/w:t='Abstract']]" mode="cat">
    <!--(A-P)-->

    <p id="Par{position()}" class="Para">
      <xsl:value-of select ="."/>
    </p>

  </xsl:template>


  <!--下面这段xPath是一段很复杂的xpath
  w:p 代表节点测试 从根节点选择所有的段落
  [preceding-sibling::w:p[w:pPr/w:pStyle[@w:val=2]] 限定谓语 preceding-sibling::w:p代表上下文节点的前面的w:p兄弟节点 [w:pPr/w:pStyle[@w:val=2] 前面兄弟节点样式为2的节点
  继承上述  [position()=1] 代表当前上下文节点中 前面兄弟节点中样式为2的 第一个
  继承上述  [w:r/w:t='Abstract'] 并且要求这个第一个样式为2的前面兄弟节点的 w:t为Abstract
  -->
  <xsl:template match="//w:p[preceding-sibling::w:p[w:pPr/w:pStyle[@w:val='2']][position()=1][w:r/w:t='Abstract']]">
    <!--A-->
    <xsl:choose>
      <xsl:when test="w:pPr/w:pStyle/@w:val='2'">
      </xsl:when>
      <xsl:otherwise>

        <xsl:choose>
          <xsl:when test="w:pPr/w:pStyle/@w:val='3'">

            <xsl:apply-templates select="//w:p[w:pPr/w:pStyle[@w:val='3']][preceding-sibling::w:p[w:pPr/w:pStyle[@w:val='2']][position()=1][w:r/w:t='Abstract']]" mode="dog"/>

          </xsl:when>
          <xsl:otherwise>

            <xsl:apply-templates select="//w:p[not(w:pPr/w:pStyle)][preceding-sibling::w:p[w:pPr/w:pStyle[@w:val='2']][position()=1][w:r/w:t='Abstract']]" mode="cat"/>
            <xsl:if test="following-sibling::w:p[w:pPr/w:pStyle[@w:val='3']]">

              <xsl:value-of select="'&lt;/div>'" disable-output-escaping="yes"/>
              我是结束
            </xsl:if>

          </xsl:otherwise>

        </xsl:choose>

      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <!--将论文中的引用转成html-->
  <xsl:template match="/w:body/w:p[w:bookmarkStart[starts-with(@w:name,'_Ref')]]">
    <!--获取这个段落的书签的w;name属性值 存入局部变量ref_val中-->
    <xsl:variable name="ref_val" select="descendant::w:bookmarkStart[starts-with(@w:name,'_Ref')]/@w:name"/>
    <xsl:variable name="ref_info" select="."/>
    <xsl:for-each select="$referencedata">
      <xsl:if test="@w:name=$ref_val">
        <li class="Citation">
          <cite class="CitationContent" id="{concat('CR',@w:id)}">
            <xsl:value-of select="$ref_info"/>
          </cite>
        </li>
      </xsl:if>
    </xsl:for-each>

  </xsl:template>
</xsl:stylesheet>