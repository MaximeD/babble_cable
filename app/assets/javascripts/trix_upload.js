$(function() {
    var deleteFile, sendFile;
    document.addEventListener('trix-attachment-add', function(event) {
        var attachment;
        attachment = event.attachment;
        if (attachment.file) {
            return sendFile(attachment);
        }
    });
    document.addEventListener('trix-attachment-remove', function(event) {
        var attachment;
        attachment = event.attachment;
        return deleteFile(attachment);
    });
    sendFile = function(attachment) {
        var file, form, xhr;
        file = attachment.file;
        form = new FormData;
        form.append('Content-Type', file.type);
        form.append('image[image]', file);
        xhr = new XMLHttpRequest;
        xhr.open('POST', '/uploads', true);
        xhr.upload.onprogress = function(event) {
            var progress;
            progress = void 0;
            progress = event.loaded / event.total * 100;
            return attachment.setUploadProgress(progress);
        };
        xhr.onload = function() {
            var response;
            response = JSON.parse(this.responseText);
            return attachment.setAttributes({
                url: response.url,
                image_id: response.image_id,
                href: response.url
            });
        };
        return xhr.send(form);
    };
    /*deleteFile = function(n) {
        return $.ajax({
            type: 'DELETE',
            url: '/uploads/' + n.attachment.attributes.values.image_id,
            cache: false,
            contentType: false,
            processData: false
        });
    };*/
});
