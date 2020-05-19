<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>


    <xsl:param name="type"/>
    <xsl:param name="name"/>

    <xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />


    <xsl:template match="/">


        <xsl:if test="$type='All-Schools'">
            <xsl:choose>
                <xsl:when test="not($name)">
                    <h2><xsl:value-of select="count(London-Schools/*/School)"/> match(es) found</h2>
                </xsl:when>
                <xsl:otherwise>
                    <h2><xsl:value-of select="count(London-Schools/*/School[contains(translate(Name,$lowercase,$uppercase),translate($name,$lowercase,$uppercase))])"/> match(es) found</h2>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
        <xsl:if test="$type!='All-Schools'">
            <xsl:choose>
                <xsl:when test="not($name)">
                    <h2><xsl:value-of select="count(London-Schools/*[name()=$type]/School)"/> match(es) found</h2>
                </xsl:when>
                <xsl:otherwise>
                    <h2><xsl:value-of select="count(London-Schools/*[name()=$type]/School[contains(translate(Name,$lowercase,$uppercase),translate($name,$lowercase,$uppercase))])"/> match(es) found</h2>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>



        <table>
            <tr>
                <th>School</th>
                <th>Board</th>
                <th>Address</th>
            </tr>

            <xsl:choose>
                <xsl:when test="$type='All-Schools'">
                    <xsl:for-each select="London-Schools/*/School">
                        <xsl:sort select="@short-name" />
                        <xsl:choose>
                            <xsl:when test="not($name)">
                                <tr>
                                    <td>
                                        <xsl:element name="a">
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="Website"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="Name"/>
                                        </xsl:element>
                                    </td>
                                    <td><xsl:value-of select="Board"/></td>
                                    <td><xsl:value-of select="Address"/></td>
                                </tr>
                            </xsl:when>
                            <xsl:when test="contains(translate(Name,$lowercase,$uppercase),translate($name,$lowercase,$uppercase))">
                                <tr>
                                    <td>
                                        <xsl:element name="a">
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="Website"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="Name"/>
                                        </xsl:element>
                                    </td>
                                    <td><xsl:value-of select="Board"/></td>
                                    <td><xsl:value-of select="Address"/></td>
                                </tr>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="London-Schools/*[name()=$type]/School">
                        <xsl:sort select="@short-name" />
                        <xsl:choose>
                            <xsl:when test="not($name)">
                                <tr>
                                    <td>
                                        <xsl:element name="a">
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="Website"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="Name"/>
                                        </xsl:element>
                                    </td>
                                    <td><xsl:value-of select="Board"/></td>
                                    <td><xsl:value-of select="Address"/></td>
                                </tr>
                            </xsl:when>
                            <xsl:when test="contains(translate(Name,$lowercase,$uppercase),translate($name,$lowercase,$uppercase))">
                                <tr>
                                    <td>
                                        <xsl:element name="a">
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="Website"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="Name"/>
                                        </xsl:element>
                                    </td>
                                    <td><xsl:value-of select="Board"/></td>
                                    <td><xsl:value-of select="Address"/></td>
                                </tr>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
        </table>
    </xsl:template>
</xsl:stylesheet>
