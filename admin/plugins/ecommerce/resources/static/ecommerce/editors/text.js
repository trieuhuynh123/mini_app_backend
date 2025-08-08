/*!
 * Copyright 2022 youngmonkeys.org
 *
 * Licensed under the ezyplatform, Version 1.0.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://youngmonkeys.org/licenses/ezyplatform-1.0.0.txt
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

var ezytext = ezytext || {};
var ezyTarget;
if (typeof ezyadmin != 'undefined') {
    ezyTarget = ezyadmin;
} else if (typeof ezyweb != 'undefined') {
    ezyTarget = ezyweb;
}

var ezyarticle = ezyarticle || {};

ezyarticle.textEditorHtmlTempByName = {};

ezyarticle.createTextContentHolderEditor = function(name) {
    return {
        onChange: (content) => {},
        setHtml: (html) => { ezyarticle.textEditorHtmlTempByName[name] = html; },
        getHtml: () => ezyarticle.textEditorHtmlTempByName[name],
        settings: {}
    }
};

ezyarticle.textEditorByName = {};

if (!ezyarticle.editor) {
    ezyarticle.editor = ezyarticle.createTextContentHolderEditor('defaultEditor');
    ezyarticle.textEditorByName['defaultEditor'] = ezyarticle.editor;
}

ezyarticle.createTextEditorIfNotExists = function(settings) {
    var name = settings?.name || 'defaultEditor';
    if (!ezyarticle.textEditorByName[name]) {
        ezyarticle.createTextEditor(settings);
    }
    return ezyarticle.textEditorByName[name];
}

ezyarticle.createTextEditor = function(settings) {
    var actualSettings = {
        name: 'defaultEditor',
        container: 'ezyarticleEditor',
        rows: 20,
        enableAddMediaButton: true,
        ...ezyarticle.defaultTextEditorSetting,
        ...settings
    };
    var editorName = actualSettings.name;
    var editorContainer = actualSettings.container;
    var editorRows = actualSettings.rows;
    var placeholder = actualSettings.placeholder || '';
    var text = ezyarticle.textEditorHtmlTempByName[editorName]
            || actualSettings.initializedContent
            || 'Let\'s create a new article!';
    var enableAddMediaButton = actualSettings.enableAddMediaButton;
    var html = '';
    if (enableAddMediaButton) {
        html += `
            <div>
                <button type="button" class="btn btn-outline-primary pt-0 pb-0"
                        id="${editorName}AddMediaButton">
                    <i class="fas fa-photo-video"></i>
                    ${ezyTarget.messages.add_media}
                </button>
            </div>
        `;
    };
    html += `
        <textarea id="${editorName}" class="form-control"
                  placeholder="${placeholder}" rows="${editorRows}"
                  onkeydown="ezyarticle.onTextEditorKeydown(this, event);">${text.trim()}</textarea>
    `;
    $(`div#${editorContainer}`).html(html);

    var textEditor = $(`#${editorName}`);
    var editor = ezyarticle.textEditorByName[editorName];
    if (!editor) {
        editor = ezyarticle.createTextContentHolderEditor(editorName);
        ezyarticle.textEditorByName[editorName] = editor;
    }
    editor.settings = actualSettings;
    editor.getHtml = () => textEditor.val();
    editor.setHtml = (html) => textEditor.val(html);
    editor.remove = () => ezyarticle.textEditors.remove(editorName);
    editor.onChange = actualSettings.onEditorContentChange || editor.onChange ||  ((content) => {});
    editor.onRemove = actualSettings.onEditorRemove;
    editor.onRemoved = actualSettings.onEditorRemoved;

    textEditor.on('input', function() {
         editor.onChange($(this).val());
    });

    $(`#${editorName}AddMediaButton`).on('click', function() {
        (ezyTarget.showMediaModal || showMediaModal)('textMedia')
            .onMediaSelected(media => {
                ezyarticle.insertMediaHtml(textEditor, media);
                (ezyTarget.closeMediaModal || closeMediaModal)();
            });
    });
    return editor;
}

ezyarticle.onTextEditorKeydown = function(e, event) {
    if (event.key === 'Tab') {
        event.preventDefault();
        var start = e.selectionStart;
        var end = e.selectionEnd;
        var value = e.value;
        e.value = value.substring(0, start) + '  ' + value.substring(end);
        e.selectionStart = e.selectionEnd = start + 2;
    }
    if ((event.ctrlKey || event.metaKey) && event.key === 's') {
        event.preventDefault();
        if (ezyarticle.triggerSaveEvent) {
            ezyarticle.triggerSaveEvent();
        }
    }
}

ezytext.removeTextEditor = function(editorName) {
    var actualEditorName = editorName || 'defaultEditor';
    var editor = ezyarticle.textEditors.get(editorName);
    if (editor) {
        if (editor.onRemove) {
            editor.onRemove(editor);
        } else {
            var container = editor.settings.container;
            $(`#${container}`).html('');
        }
        delete ezyarticle.textEditorByName[editorName];
        delete ezyarticle.textEditorHtmlTempByName[editorName];
        if (editor.onRemoved) {
            editor.onRemoved(editor);
        }
    }
}

ezytext.removeAllTextEditors = function() {
    Object.keys(ezyarticle.textEditorByName).forEach((editorName) => {
        ezytext.removeTextEditor(editorName);
    });
    ezyarticle.textEditorByName['defaultEditor'] = ezyarticle.editor;
}

ezyarticle.insertMediaHtml = function(editor, media) {
    var cursorPos = editor[0].selectionStart;
    var textValue = editor.val();
    var textBeforeCursor = textValue
        .substring(0, cursorPos);
    var textAfterCursor = textValue
        .substring(cursorPos, textValue.length);
    var insertedHtml = ezyarticle.makeTextHtmlFromMedia(media);
    var newHtmlValue = textBeforeCursor
        + insertedHtml + textAfterCursor;
    editor.val(newHtmlValue);
}

ezyarticle.makeTextHtmlFromMedia = function(media) {
    var mediaName = media.originalName || media.name;
    var mediaUrl = ezyTarget.extractMediaUrl(media);
    if (media.type == 'IMAGE') {
        return `<img src="${mediaUrl}" alt="${mediaName}">`;
    }
    if (media.type == 'VIDEO') {
        return `<video controls>
                <source src="${mediaUrl}" type="video/mp4">
                <source src="${mediaUrl}" type="video/ogg">
            </video>`;
    }
    if (media.type == 'AUDIO') {
        return `<audio controls>
                <source src="${mediaUrl}" type="audio/mp3">
                <source src="${mediaUrl}" type="audio/ogg">
            </audio>`;
    }
    return `<a href="${mediaUrl}">${mediaName}</a>`;
}

ezyarticle.textEditors = {
    get: (name) => {
        return ezyarticle.textEditorByName[name];
    },
    create: ezyarticle.createTextEditor,
    createIfNotExists: ezyarticle.createTextEditorIfNotExists,
    remove: ezytext.removeTextEditor,
    clear: ezytext.removeAllTextEditors
};

$(document).ready(() => {
    if (ezyarticle.createDefaultEditor || ezyarticle.createDefaultTextEditor) {
        ezyarticle.createTextEditor();
    }
});
