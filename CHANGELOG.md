# Project Information - Revisions

## Version numbering

The Help Aggregator Service uses the following version numbering scheme: **MAJOR.MINOR.PATCH**

Help Aggregator CI pipeline automatically creates drops for each change, which will have a build version:
**MAJOR.MINOR.PATCH-BUILD**

Not all drop is marked as ready for release. The marked ones are published with `+` in
their version number: **MAJOR.MINOR.PATCH+BUILD**

### Jira tickets

The release note should contain all changes. For a bug the related Jira ticket also should be linked.

### Structure

The list below groups the changes according to the main version. Also a start and end date is provided
to show the period when commits were merged for that release.

If a change is added to the list, select the latest version and add the change to that section.
If the main version is changed then create a new section with open interval and also add the close date
to the previous version.

<!-- markdownlint-disable MD013 -->

## Versions

### 0.2.0 - (2022. 03. 17. - )

[See all the changes here](https://gerrit-gamma.gic.ericsson.se/#/dashboard/?title=Help+Aggregator+Release&0.2.0=project:OSS/com.ericsson.oss.use/eric-oss-network-assurance-search+is:merged+after:"2022-06-30%2013:20:19%20%252B0300")

### 0.1.0 - (2022. 03. 17. - 2022. 06. 30.)

[See all the changes here](https://gerrit-gamma.gic.ericsson.se/#/dashboard/?title=Help+Aggregator+Release&0.1.0=project:OSS/com.ericsson.oss.use/eric-oss-network-assurance-search+is:merged+after:"2022-03-03%2013:32:00%20%252B0200"+before:"2022-06-30%2013:20:19%20%252B0300")
