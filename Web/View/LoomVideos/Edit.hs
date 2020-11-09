module Web.View.LoomVideos.Edit where
import Web.View.Prelude

data EditView = EditView { loomVideo :: LoomVideo }

instance View EditView ViewContext where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={LoomVideosAction}>LoomVideos</a></li>
                <li class="breadcrumb-item active">Edit LoomVideo</li>
            </ol>
        </nav>
        <h1>Edit LoomVideo</h1>
        {renderForm loomVideo}
    |]

renderForm :: LoomVideo -> Html
renderForm loomVideo = formFor loomVideo [hsx|
    {(textField #title)}
    {(textField #description)}
    {(textField #link)}
    {submitButton}
|]
