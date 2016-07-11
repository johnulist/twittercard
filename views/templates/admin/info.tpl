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
{if $smarty.const._PS_VERSION_|@addcslashes:'\'' < '1.6'}
    <fieldset>
        <legend>
            {l s='Twitter Summary Cards w/ Large Image' mod='twittercard'}
        </legend>
        <p>
            {l s='Help Screen To Use Module.' mod='twittercard'}
            <br>
        </p>
    </fieldset>
{else}
    <div class="container-fluid" style="margin-top: 25px;">
        <div class="row">
            <div class="col-md-4">
                <h1>
                    {l s='Thank you for your module purchase!' mod='twittercard'}
                </h1>
                <p>
                    {l s='StrikeHawk eCommerce, Inc. would like to thank you for your recent module purchase. Support is limited to your envato support package add-on.' mod='twittercard'}
                </p>
                <p>
                    {l s='Module installation and configuration can be found in the video to the right and through our knowledgebase system link below the video. Any valid purchase with a valid envato support package may freely submit ticket issues in our support portal links found below. It will <strong>require</strong> an account registration prior to submitting your new issue.' mod='twittercard'}
                </p>
                <p>
                    <strong>{l s='Be sure to read the license agreement and legal disclaimer files found in your purchased zip archive file.' mod='twittercard'}</strong>
                </p>
                <div class="well well-lg">
                    <ul class="list-unstyled">
                        <li style="padding-bottom: 20px;">
                            <i class="icon-check-square-o" aria-hidden="true"></i> {l s='Register your module Support.' mod='twittercard'}
                            <a href="https://services.strikehawk.com/register.php" class="btn btn-info"
                               role="button">{l s='Link' mod='twittercard'}</a>
                        </li>
                        <li>
                            <i class="icon-child"
                               aria-hidden="true"></i> {l s='Support Portal For Registered Customers.' mod='twittercard'}
                            <a href="https://services.strikehawk.com/clientarea.php" class="btn btn-info"
                               role="button">{l s='Link' mod='twittercard'}</a>
                        </li>
                    </ul>
                    <div class="clear">&nbsp;</div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="media well">
                    <div class="media-body">
                        <h2 class="media-heading">
                            {l s='Installation Tutorial' mod='twittercard'}
                        </h2>
                        <div class="media" align="center">
                            <iframe width="640" height="360"
                                    src="https://www.youtube-nocookie.com/embed/x6PVglpRnV4?rel=0&amp;showinfo=0"
                                    frameborder="0" allowfullscreen></iframe>
                            <div class="media-body">
                                <h2 class="media-heading">
                                    {l s='Twitter Card with Large Image Video Tutorial' mod='twittercard'}
                                </h2>
                                <p>
                                    {l s='If you are still confused after watching the video or cannot see its content, click here to read the full knowledge base article.' mod='twittercard'}
                                </p>
                                <p>
                                    <a href="#" class="btn btn-info" role="button">{l s='Open External Link' mod='twittercard'}</a>
                                </p>
                            </div>
                            <script src="https://apis.google.com/js/platform.js"></script>

                            <div class="g-ytsubscribe" data-channelid="UCVHjzEGC0GsBSMynK0fJmEg" data-layout="full"
                                 data-count="default"></div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h1 class="panel-title">
                            {l s='PrestaShop Low Traffic Hosting' mod='twittercard'}
                            <span class="lead text-danger pull-right">$9.95 USD /mo</span>
                        </h1>
                    </div>
                    <div class="panel-body">
                        <figure>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>
                                        {l s='Feature' mod='twittercard'}
                                    </th>
                                    <th>
                                        {l s='Details' mod='twittercard'}
                                    </th>
                                    <th>
                                        {l s='Available' mod='twittercard'}
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>

                                    <td>
                                        {l s='Disk Quota' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='2 Gigabytes' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='Yes' mod='twittercard'}
                                    </td>
                                </tr>
                                <tr class="active">

                                    <td>
                                        {l s='Traffic Bandwidth' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='25 Gigabytes' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='Yes' mod='twittercard'}
                                    </td>
                                </tr>
                                <tr class="info">
                                    <td>
                                        {l s='Email Accounts' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='5 Pop3/Imap Users' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='Yes' mod='twittercard'}
                                    </td>
                                </tr>
                                <tr class="success">
                                    <td>
                                        {l s='Cart Support' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='Email' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='Yes' mod='twittercard'}
                                    </td>
                                </tr>
                                <tr class="warning">
                                    <td>
                                        {l s='SSL Security' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='SSL Certificate' mod='twittercard'}
                                    </td>
                                    <td>
                                        $16.50 USD /yr
                                    </td>
                                </tr>
                                <tr class="danger">

                                    <td>
                                        {l s='Storage Device' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='Solid State Drive' mod='twittercard'}
                                    </td>
                                    <td>
                                        $5.95 USD /mo
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <figcaption>{l s='Free Migration or Installation' mod='twittercard'}</figcaption>
                        </figure>
                    </div>
                    <div class="panel-footer">
                        <a href="#" class="btn btn-block btn-lg btn-success active" type="button">{l s='Order Hosting' mod='twittercard'}</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h1 class="panel-title">
                            {l s='PrestaShop Medium Traffic Hosting' mod='twittercard'}
                            <span class="text-danger lead pull-right">$19.95 USD /mo</span> USD
                        </h1>
                    </div>
                    <div class="panel-body">
                        <figure>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>
                                        {l s='Feature' mod='twittercard'}
                                    </th>
                                    <th>
                                        {l s='Details' mod='twittercard'}
                                    </th>
                                    <th>
                                        {l s='Available' mod='twittercard'}
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        {l s='Disk Quota' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='4 Gigabytes' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='Yes' mod='twittercard'}
                                    </td>
                                </tr>
                                <tr class="active">
                                    <td>
                                        {l s='Traffic Bandwidth' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='50 Gigabytes' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='Yes' mod='twittercard'}
                                    </td>
                                </tr>
                                <tr class="info">
                                    <td>
                                        {l s='Email Accounts' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='10 Pop3/Imap Users' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='Yes' mod='twittercard'}
                                    </td>
                                </tr>
                                <tr class="success">
                                    <td>
                                        {l s='Cart Support' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='Email, Skype' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='Yes' mod='twittercard'}
                                    </td>
                                </tr>
                                <tr class="warning">
                                    <td>
                                        {l s='SSL Security' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='SSL Certificate' mod='twittercard'}
                                    </td>
                                    <td>
                                        $16.50 USD /yr
                                    </td>
                                </tr>
                                <tr class="danger">
                                    <td>
                                        {l s='Storage Device' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='Solid State Drive' mod='twittercard'}
                                    </td>
                                    <td>
                                        $5.95 USD /mo
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <figcaption>{l s='Free Migration or Installation' mod='twittercard'}</figcaption>
                        </figure>
                    </div>
                    <div class="panel-footer">
                        <a href="#" class="btn btn-block btn-lg btn-success active" type="button">{l s='Order Hosting' mod='twittercard'}</a>
                    </div>
                </div>

            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h1 class="panel-title">
                            {l s='PrestaShop High Traffic Hosting' mod='twittercard'} <span
                                    class="text-danger lead pull-right">$29.95 USD /mo</span> USD
                        </h1>
                    </div>
                    <div class="panel-body">
                        <figure>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>
                                        {l s='Feature' mod='twittercard'}
                                    </th>
                                    <th>
                                        {l s='Details' mod='twittercard'}
                                    </th>
                                    <th>
                                        {l s='Available' mod='twittercard'}
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        {l s='Disk Quota' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='8 Gigabytes' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='Yes' mod='twittercard'}
                                    </td>
                                </tr>
                                <tr class="active">
                                    <td>
                                        {l s='Traffic Bandwidth' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='100 Gigabytes' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='Yes' mod='twittercard'}
                                    </td>
                                </tr>
                                <tr class="info">
                                    <td>
                                        {l s='Email Accounts' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='20 Pop3/Imap Users' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='Yes' mod='twittercard'}
                                    </td>
                                </tr>
                                <tr class="success">
                                    <td>
                                        {l s='Cart Support' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='Email, Skype, Phone' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='Yes' mod='twittercard'}
                                    </td>
                                </tr>
                                <tr class="warning">
                                    <td>
                                        {l s='SSL Security' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='SSL Certificate' mod='twittercard'}
                                    </td>
                                    <td>
                                        $16.50 USD /yr
                                    </td>
                                </tr>
                                <tr class="danger">
                                    <td>
                                        {l s='Storage Device' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='Solid State Drive' mod='twittercard'}
                                    </td>
                                    <td>
                                        {l s='Free' mod='twittercard'}
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <figcaption>{l s='Free Migration or Installation' mod='twittercard'}</figcaption>
                        </figure>
                    </div>
                    <div class="panel-footer">
                        <a href="#" class="btn btn-block btn-lg btn-success active" type="button">{l s='Order Hosting' mod='twittercard'}</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title" style="padding-left: 18px;">
                            <i class="icon-hand-right" aria-hidden="true"></i>
                            &nbsp; {l s='eCommerce Secure Cloud VPS Hosting' mod='twittercard'}
                        </h3>
                    </div>
                    <div class="panel-body">
                        <p class="lead">
                            {l s='All Cloud VPS servers are reconfigured to meet PCI DSS requirements including a full line of
                            security best practices before turning it over to our customers. Our techs are trained and
                            certified to work on your behalf.' mod='twittercard'}
                        </p>
                        <p class="lead">
                            {l s='We fully support the PrestaShop shopping cart and provide free cart support and limited
                            software coding support for a professional fee quoted upon project approval.' mod='twittercard'}
                        </p>
                    </div>
                    <div class="panel-footer">
                        <a href="#" class="btn btn-block btn-lg btn-success active" type="button">{l s='More Information' mod='twittercard'}</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title" style="padding-left: 18px;">
                            <i class="icon-hand-right" aria-hidden="true"></i>
                            &nbsp; {l s='eCommerce Secure Dedicated Servers' mod='twittercard'}
                        </h3>
                    </div>
                    <div class="panel-body">
                        <p class="lead">
                            {l s='Our line of dual and quad core servers are fully managed and hardened for PCI DSS. Your
                            server will be optimized to meet and exceed PrestaShop server requirements. Includes
                            intrusion detection and firewall.' mod='twittercard'}
                        </p>
                        <p class="lead">
                            {l s='We fully support the PrestaShop shopping cart and provide free cart support and
                            limited software coding support for a professional fee quoted upon project approval.' mod='twittercard'}
                        </p>
                    </div>
                    <div class="panel-footer">
                        <a href="#" class="btn btn-block btn-lg btn-success active" type="button">{l s='More Information' mod='twittercard'}</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/if}
