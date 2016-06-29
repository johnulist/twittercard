{*
 * Copyright (C) StrikeHawk eCommerce, Inc. - All Rights Reserved
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 *
 * @author    StrikeHawk eCommerce, Inc. <sales@services.strikehawk.com>
 * @copyright 2016 StrikeHawk eCommerce, Inc.
 * @license   proprietary
 * Intellectual Property of StrikeHawk eCommerce, Inc.
*}
<!-- twitter card module -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:site" content="{$twitterUser|escape:'htmlall':'UTF-8'}">
<meta name="twitter:creator" content="{$twitterUser|escape:'htmlall':'UTF-8'}">
<meta name="twitter:title" content="{$twitterHomeTitle|escape:'htmlall':'UTF-8'}">
<meta name="twitter:description" content="{$twitterHomeDescription|escape:'htmlall':'UTF-8'}">
{if $twitterHomeLogo}
	<meta name="twitter:image" content="{$twitterHomeLogoUrl|escape:'htmlall':'UTF-8'}">
	<meta name="twitter:image:alt" content="{$twitterHomeDescription|escape:'htmlall':'UTF-8'}">
{else}
	<meta name="twitter:image" content="{$logo_url|escape:'htmlall':'UTF-8'}">
{/if}
<!-- twitter card module -->