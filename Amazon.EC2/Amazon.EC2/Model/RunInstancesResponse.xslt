<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ec2="http://ec2.amazonaws.com/doc/2008-12-01/" exclude-result-prefixes="ec2">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>
    <xsl:variable name="ns" select="'http://ec2.amazonaws.com/doc/2008-12-01/'"/>
    <xsl:template match="ec2:RunInstancesResponse">
        <xsl:element name="RunInstancesResponse" namespace="{$ns}">
            <xsl:element name="ResponseMetadata" namespace="{$ns}">
                <xsl:element name="RequestId" namespace="{$ns}">
                    <xsl:value-of select="ec2:requestId"/>
                </xsl:element>
            </xsl:element>
            <xsl:element name="RunInstancesResult" namespace="{$ns}">
                <xsl:element name="Reservation" namespace="{$ns}">
                    <xsl:element name="ReservationId" namespace="{$ns}">
                        <xsl:value-of select="ec2:reservationId"/>
                    </xsl:element>
                    <xsl:element name="OwnerId" namespace="{$ns}">
                        <xsl:value-of select="ec2:ownerId"/>
                    </xsl:element>
                    <xsl:element name="RequesterId" namespace="{$ns}">
                        <xsl:value-of select="ec2:requesterId"/>
                    </xsl:element>
                    <xsl:apply-templates select="ec2:groupSet"/>
                    <xsl:apply-templates select="ec2:instancesSet"/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="ec2:groupSet">
        <xsl:for-each select="ec2:item">
            <xsl:element name="GroupName" namespace="{$ns}">
                <xsl:value-of select="ec2:groupId"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="ec2:instancesSet">
        <xsl:for-each select="ec2:item">
            <xsl:element name="RunningInstance" namespace="{$ns}">
                <xsl:element name="InstanceId" namespace="{$ns}">
                    <xsl:value-of select="ec2:instanceId"/>
                </xsl:element>
                <xsl:element name="ImageId" namespace="{$ns}">
                    <xsl:value-of select="ec2:imageId"/>
                </xsl:element>
                <xsl:apply-templates select="ec2:instanceState"/>
                <xsl:element name="PrivateDnsName" namespace="{$ns}">
                    <xsl:value-of select="ec2:privateDnsName"/>
                </xsl:element>
                <xsl:element name="PublicDnsName" namespace="{$ns}">
                    <xsl:value-of select="ec2:dnsName"/>
                </xsl:element>
                <xsl:element name="StateTransitionReason" namespace="{$ns}">
                    <xsl:value-of select="ec2:reason"/>
                </xsl:element>
                <xsl:element name="KeyName" namespace="{$ns}">
                    <xsl:value-of select="ec2:keyName"/>
                </xsl:element>
                <xsl:element name="AmiLaunchIndex" namespace="{$ns}">
                    <xsl:value-of select="ec2:amiLaunchIndex"/>
                </xsl:element>
                <xsl:apply-templates select="ec2:productCodes"/>
                <xsl:element name="InstanceType" namespace="{$ns}">
                    <xsl:value-of select="ec2:instanceType"/>
                </xsl:element>
                <xsl:element name="LaunchTime" namespace="{$ns}">
                    <xsl:value-of select="ec2:launchTime"/>
                </xsl:element>
                <xsl:element name="Placement" namespace="{$ns}">
                    <xsl:element name="AvailabilityZone" namespace="{$ns}">
                        <xsl:value-of select="ec2:placement/ec2:availabilityZone"/>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="KernelId" namespace="{$ns}">
                    <xsl:value-of select="ec2:kernelId"/>
                </xsl:element>
                <xsl:element name="RamdiskId" namespace="{$ns}">
                    <xsl:value-of select="ec2:ramdiskId"/>
                </xsl:element>
                <xsl:element name="Platform" namespace="{$ns}">
                    <xsl:value-of select="ec2:platform"/>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="ec2:productCodes">
        <xsl:for-each select="ec2:item">
            <xsl:element name="ProductCode" namespace="{$ns}">
                <xsl:value-of select="ec2:productCode"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="ec2:instanceState">
        <xsl:element name="InstanceState" namespace="{$ns}">
            <xsl:element name="Code" namespace="{$ns}">
                <xsl:value-of select="ec2:code"/>
            </xsl:element>
            <xsl:element name="Name" namespace="{$ns}">
                <xsl:value-of select="ec2:name"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
