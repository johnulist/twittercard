<!-- twitter card module -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:site" content="{$twitterUser}">
<meta name="twitter:creator" content="{$twitterUser}">
<meta name="twitter:title" content="{$twitterHomeTitle}">
<meta name="twitter:description" content="{$twitterHomeDescription}">
{if $twitterHomeLogo ==1}
	<meta name="twitter:image" content="{$logo_url}">
{else}
	<meta name="twitter:image" content="{$twitterHomeLogoUrl}">
	<meta name="twitter:image:alt" content="{$twitterHomeDescription}"
{/if}
<!-- twitter card module -->