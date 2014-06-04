<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step name="main" type="px:create-daisy3-opf" xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:px="http://www.daisy.org/ns/pipeline/xproc"
    version="1.0">

    <p:input port="source" primary="true">
      <p:documentation>The fileset.</p:documentation>
    </p:input>

    <p:option name="output-dir">
      <p:documentation xmlns="http://www.w3.org/1999/xhtml">
	<p>Root directory URI common to all the files to package (NCX, smil etc.)</p>
      </p:documentation>
    </p:option>

    <p:option name="title">
      <p:documentation xmlns="http://www.w3.org/1999/xhtml">
	<p>Title of the DTBook document.</p>
      </p:documentation>
    </p:option>

    <p:option name="uid">
      <p:documentation xmlns="http://www.w3.org/1999/xhtml">
	<p>UID of the DTBook (in the meta elements)</p>
      </p:documentation>
    </p:option>

    <p:option name="total-time">
      <p:documentation xmlns="http://www.w3.org/1999/xhtml">
	<p>Total duration as returned by px:create-smil-files</p>
      </p:documentation>
    </p:option>

    <p:option name="opf-uri">
      <p:documentation xmlns="http://www.w3.org/1999/xhtml">
	<p>Output directory URI if the OPF file were to be stored or refered by a fileset.</p>
      </p:documentation>
    </p:option>

    <p:option name="lang">
      <p:documentation xmlns="http://www.w3.org/1999/xhtml">
	<p>Main language of the DTBook file(s).</p>
      </p:documentation>
    </p:option>

    <p:option name="publisher"/>

    <p:output port="result" primary="true"/>

    <p:xslt>
      <p:input port="stylesheet">
	<p:document href="create-opf.xsl"/>
      </p:input>
      <p:with-param name="lang" select="$lang"/>
      <p:with-param name="publisher" select="$publisher"/>
      <p:with-param name="output-dir" select="$output-dir"/>
      <p:with-param name="uid" select="$uid"/>
      <p:with-param name="title" select="$title"/>
      <p:with-param name="total-time" select="$total-time"/>
    </p:xslt>

    <p:add-attribute match="/*" attribute-name="xml:base">
      <p:with-option name="attribute-value" select="$opf-uri"/>
    </p:add-attribute>

</p:declare-step>