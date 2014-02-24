#!/bin/sh -

for flac in *.flac; do
    metaflac --no-utf8-convert --export-tags-to="$(basename "$flac" flac)tag" "$flac"
    flac --delete-input-file -d "$flac"
    flac --delete-input-file -8 "$(basename "$flac" flac)wav"
    metaflac --no-utf8-convert --import-tags-from="$(basename "$flac" flac)tag" "$flac"
    rm -f "$(basename "$flac" flac)tag"
done
