{*
 * Copyright (C) Mijn Presta - All Rights Reserved
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 *
 * @author    Michael Dekker <prestashopaddons@mijnpresta.nl>
 * @copyright 2015-2016 Mijn Presta
 * @license   proprietary
 * Intellectual Property of Mijn Presta
*}
<nav class="navbar navbar-default" role="navigation">
	<ul class="nav navbar-nav">
		{if isset($menuTabs)}
			{foreach from=$menuTabs item=tab}
				<li class="{if $tab.active}active{/if}">
					<a id="{$tab.short|escape:'htmlall':'UTF-8'}" href="{$tab.href|escape:'htmlall':'UTF-8'}">
						<span class="icon {$tab.icon|escape:'htmlall':'UTF-8'}"></span>
						{$tab.desc|escape:'htmlall':'UTF-8'}
					</a>
				</li>
			{/foreach}
		{/if}
	</ul>
</nav>