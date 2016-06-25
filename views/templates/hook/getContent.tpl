<fieldset>
    <h2>Twitter Card Configuration</h2>
    <div class="panel">
        <div class="panel-heading">
            <legend><i class="icon-cogs icon-2x icon-light"></i>
            </legend>
        </div>
        <form action="" method="post">
            <div class="form-group clearfix">
                <label for="twitterhandle">{l s='Twitter Name (ex. @strikehawkecomm)' mod='twittercard'}</label>
                <input type="text" id="twitterhandle" name="twitterhandle" placeholder="@username" size="16"
                       value="{$twitterhandle}">
            </div>
            <div class="form-group clearfix">
                <label for="hometitle">{l s='Home Page Title' mod='twittercard'}</label>
                <input type="text" id="hometitle" name="hometitle" placeholder="Site Title" size="70"
                       value="{$hometitle}">
                <label for="homedesc">{l s='Home Page Description limit 200 chars.' mod='twittercard'}</label>
                <textarea id="homedesc" name="homedesc" maxlength="200" cols="80" rows="4">{$homedesc}</textarea>
                <div class="margin-form">Home Page Image<br>
                    <input type="radio" name="homelogo" value="1"> {l s='Use logo' mod='tittercard'}<br>
                    <input type="radio" name="homelogo" value="0"> {l s='Use Custom' mod='twittercard'}<br>
                </div>
                <label for="homelogourl">{l s='Enter The Logo URL' mod='twittercard'}</label>
                <input type="url" id="homelogourl" size="70" maxlength="150" name="homelogourl"
                       value="{$homologourl}">
            </div>
            <div class="panel-footer">
                <button class="btn btn-2" type="submit" name="submitModule">{l s='Save' mod='twittercard'}</button>
                <p>
                    {l s='You can test your Twitter Cards <a href="https://dev.twitter.com/docs/cards/validation/validator">here.</a>' mod='twittercard'}
                </p>
            </div>
        </form>
</fieldset>