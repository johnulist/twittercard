{*
 * Copyright (C) Mijn Presta - All Rights Reserved
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 *
 * @author    Michael Dekker <prestashopaddons@mijnpresta.nl>
 * @copyright 2015-2016 Mijn Presta
 * @license   proprietary
 * Intellectual Property of Mijn Presta
*}s
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