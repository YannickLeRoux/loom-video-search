module Web.View.LoomVideos.New where
import Web.View.Prelude

data NewView = NewView { loomVideo :: LoomVideo }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={LoomVideosAction}>LoomVideos</a></li>
                <li class="breadcrumb-item active">New LoomVideo</li>
            </ol>
        </nav>
        <h1>New LoomVideo</h1>
        {renderForm loomVideo}
    |]

renderForm :: LoomVideo -> Html
renderForm loomVideo = formFor loomVideo [hsx|
    {(textField #title)}
    {(textField #description)}
    {(textField #link)}
    {submitButton}
|]
