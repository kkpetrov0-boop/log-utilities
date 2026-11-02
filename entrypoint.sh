#!/bin/sh
exec logtail "${LOGTAIL_PATH}" --group-by "${LOGTAIL_GROUP_BY}" --format "${LOGTAIL_FORMAT}" --pattern "${LOGTAIL_PATTERN}" --interval "${LOGTAIL_INTERVAL}"
