<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                exclude-result-prefixes="msxsl"
                
                xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <xsl:output method="html" indent="yes" encoding="utf-8"/>
  <!--<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;&nbsp;]]></xsl:text>-->


    <xsl:param name="titleStyleId" />
  <!--注意在以下select表达式中 @w:val=$titleStyleId 不能写成 @w:val='$titleStyleId' 即在xsl表达式中参数不能带引号 -->
  <xsl:variable name="title" select="//w:p[w:pPr/w:pStyle/@w:val=$titleStyleId]" />
  <xsl:template match="/">
    <html lang="en" class="no-js">
      <head>
        <title>
          <xsl:value-of select="$title"/>
        </title>
        <!--这里存放meta元数据-->
        
        
      </head>
      <body class="fulltext">
        
        
        
        <p>
          <xsl:value-of select="$title"/>
        </p>
        <p>
          <!--//w:p[count(w:r)>0]：获取不为空的段落
              //w:p[count(w:r)>0][2]：获取第二个不为空的段落-->
          作者:<xsl:apply-templates select="//w:p[count(w:r)>0][2]" />
        </p>
        <p>
          单位:<xsl:apply-templates select="//w:p[count(w:r)>0][3]" />
        </p>
        <p>
          导航:<xsl:apply-templates select="//w:p[w:pPr/w:pStyle[@w:val=1]]" mode="Daohang"/>
        </p>
        <!--<xsl:apply-templates select="//w:p[w:pPr/w:pStyle[@w:val=1]]" mode="h1"/>-->
        <xsl:apply-templates select="//w:p" mode="MainOperate"/>

        <!--<xsl:for-each select="//w:p[count(w:r)>0]">
          <xsl:if test="position()>3">
            <xsl:value-of select="."/>
            <br/>
          </xsl:if>
        </xsl:for-each>-->
      </body>
    </html>
  </xsl:template>

  <!--导航-->
  <xsl:template match="//w:p[w:pPr/w:pStyle[@w:val=1]]" mode="Daohang">
    <xsl:value-of select="."/> |
  </xsl:template>


  <!--拿到所有样式为标题1的节点-->
  <!--<xsl:template match="w:p[w:pPr/w:pStyle[@w:val=1]]" mode="h1">
    <br/>
    <h1>
      <xsl:value-of select="."/>      :
    </h1>
    <br/>
  </xsl:template>-->

  <xsl:template mode="MainOperate" match="w:p">
    <xsl:choose>
      <xsl:when test="w:pPr/w:pStyle[@w:val=1]">
        <h1>
          <xsl:value-of select="."/>
        </h1>
      </xsl:when>
      <xsl:when test="position()>3 and count(w:r)>0">
        我是小段落：<xsl:value-of select="."/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>