#! /bin/sh

I18NDOMAIN="collective.z3cform.widgets"
BASE_DIRECTORY="src/collective/z3cform/widgets"

# Synchronise the templates and scripts with the .pot.
i18ndude rebuild-pot --pot ${BASE_DIRECTORY}/locales/${I18NDOMAIN}.pot \
    --create ${I18NDOMAIN} \
    ${BASE_DIRECTORY}

# Synchronise the resulting .pot with all .po files
for po in ${BASE_DIRECTORY}/locales/*/LC_MESSAGES/${I18NDOMAIN}.po; do
    i18ndude sync --pot ${BASE_DIRECTORY}/locales/${I18NDOMAIN}.pot $po
done

# Report of errors and suspect untranslated messages
i18ndude find-untranslated ${BASE_DIRECTORY}
