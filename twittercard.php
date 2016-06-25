<?php
/*
* 2007-2012 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2012 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/
if ( ! defined( '_CAN_LOAD_FILES_' ) ) {
	exit;
}

class Twittercard extends Module {
	public function __construct() {
		$this->name = 'twittercard';
		if ( version_compare( _PS_VERSION_, '1.4.0.0' ) >= 0 ) {
			$this->tab = 'front_office_features';
		} else {
			$this->tab = 'Blocks';
		}
		$this->version     = '1.0';
		$this->author      = 'StrikeHawk eCommerce, Inc.';
		$this->displayName = $this->l( 'Twitter Summary With Large Image Card' );
		$this->description = $this->l( 'Adds Twitter Summary Card with large image to your site' );
		parent::_construct();
	}
}

public
function install() {
	$this->_clearCache( 'twittercard.tpl' );

	return ( parent::install()
	         && Configuration::updateValue( 'twitterhandle', '' )
	         && Configuration::updateValue( 'hometitle', '' )
	         && Configuration::updateValue( 'homedesc', '' )
	         && Configuration::updateValue( 'homelogo', '' )
	         && Configuration::updateValue( 'homelogourl', '' )
	         && $this->registerHook( 'header' ) );
}

public
function uninstall() {
	$this->_clearCache( 'twittercard.tpl' );

	return (
		! Configuration::deleteByName( 'twitterhandle' ) ||
		! Configuration::deleteByName( 'hometitle' ) ||
		! Configuration::deleteByName( 'homedesc' ) ||
		! Configuration::deleteByName( 'homelogo' ) ||
		! Configuration::deleteByName( 'homelogourl' ) ||
		parent::uninstall() );
}

public
function getContent() {

	if ( isset( $_POST['submitModule'] ) ) {
		Configuration::updateValue( 'twitterhandle',
			( ( isset( $_POST['twitterhandle'] ) && $_POST['twitterhandle'] != '' ) ? $_POST['twitterhandle'] : '' ),
			true );
		Configuration::updateValue( 'hometitle', Tools::getValue( 'hometitle' ) );
		Configuration::updateValue( 'homedesc', Tools::getValue( 'homedesc' ) );
		Configuration::updateValue( 'homelogo', Tools::getValue( 'homelogo' ) );
		Configuration::updateValue( 'homelogourl', Tools::getValue( 'homelogourl' ) );
		$html .= '<div class="confirm" style="height:40px;padding-left:40px;line-height:40px;">' . $this->l( 'Configuration updated' ) . '</div>';
	}

	return $this->display( __FILE__, 'getcontent.tpl' );
}

}

public
function hookHeader( $params ) {
	global $smarty, $cookie, $link;
	$current_page = get_class( $this->context->controller );
	if ( $current_page == "ProductController" ) {
		$cover       = Product::getCover( intval( Tools::getValue( 'id_product' ) ) );
		$productinfo = Product::getCover( intval( Tools::getValue( 'id_product' ) ) );
		$product     = new Product( $_GET['id_product'], false, intval( $cookie->id_lang ) );
		if ( is_array( $cover ) && sizeof( $cover ) == 1 ) {
			$fb_cover      = '';
			$protocol_link = @$_SERVER['HTTPS'] == "on" ? "https://" : "http://";
			if ( $id_product = (int) Tools::getValue( 'id_product' ) ) {
				$product = new Product( $id_product, true, $this->context->language->id, $this->context->shop->id );
			}

			$twitter_image = $link->getImageLink( $product->link_rewrite[ $cookie->id_lang ],
				Tools::getValue( 'id_product' ) . '-' . $cover['id_image'], 'thickbox_default' );
		}
	} else {
	}

	global $smarty;
	if ( $current_page == "ProductController" ) {
		$smarty->assign( array(
			'twitter_site'         => Configuration::get( 'twitterhandle' ),
			'twitter_product_name' => $product->name,
			'twitter_description'  => $product->description_short,
			'twitter_image'        => $twitter_image,
			'twitter_image_alt'    => $product->legend,
			'twitter_price'        => $product->price
		) );
	} else {
		$smarty->assign( array(
			'twitter_site'        => Configuration::get( 'twitterhandle' ),
			'twitter_hometitle'   => Configuration::get( 'hometitle' ),
			'twitter_homedesc'    => Configuration::get( 'homedesc' ),
			'twitter_homelogo'    => Configuration::get( 'homelogo' ),
			'twitter_homelogourl' => Configuration::get( 'homelogourl' )
		) );
	}

	return $this->display( __FILE__, 'twittercard.tpl', $this->getCacheId() );
}
}
