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
{extends file="helpers/form/form.tpl"}

{block name="input"}
	{if $input.type == 'switch' && $smarty.const._PS_VERSION_|@addcslashes:'\'' < '1.6'}
			<input type="radio" name="{$input.name|escape:'htmlall':'UTF-8'}"
				   id="{$input.name|escape:'htmlall':'UTF-8'}_on"
				   value="1"
				   {if $fields_value[$input.name]}checked="checked"{/if}
					{if isset($input.disabled) && $input.disabled}disabled="disabled"{/if} />
			<label class="t" for="{$input.name|escape:'htmlall':'UTF-8'}_on">
				{if isset($input.is_bool) && $input.is_bool == true}
					<img src="../img/admin/enabled.gif" alt="{$value[0].label|escape:'htmlall':'UTF-8'}"
						 title="{$value[0].label|escape:'htmlall':'UTF-8'}" />
				{else}
					{$value[0].label|escape:'htmlall':'UTF-8'}
				{/if}
			</label>
			{if isset($input.br) && $input.br}<br />{/if}
			{if isset($value[0].p) && $value.p}<p>{$value[0].p|escape:'htmlall':'UTF-8'}</p>{/if}

			<input type="radio" name="{$input.name|escape:'htmlall':'UTF-8'}"
				   id="{$input.name|escape:'htmlall':'UTF-8'}_off"
				   value=""
				   {if !$fields_value[$input.name]}checked="checked"{/if}
					{if isset($input.disabled) && $input.disabled}disabled="disabled"{/if} />
			<label class="t" for="{$input.name|escape:'htmlall':'UTF-8'}_off">
				{if isset($input.is_bool) && $input.is_bool == true}
						<img src="../img/admin/disabled.gif" alt="{$value[1].label|escape:'htmlall':'UTF-8'}"
							 title="{$value[1].label|escape:'htmlall':'UTF-8'}" />
				{else}
					{$value[1].label|escape:'htmlall':'UTF-8'}
				{/if}
			</label>
			{if isset($input.br) && $input.br}<br />{/if}
			{if isset($value[1].p) && $value[1].p}<p>{$value[1].p|escape:'htmlall':'UTF-8'}</p>{/if}

	{else}
		{$smarty.block.parent}
	{/if}
{/block}