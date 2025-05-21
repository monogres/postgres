# 🐘 Monogres PostgreSQL Mirror

[Monogres] mirror of the [official PostgreSQL repository], with [reproducible
build] branches per PostgreSQL version.

## 🪞 Structure

The mirror syncs the official PostgreSQL repository, so it has all of the tags,
branches, etc, available upstream.

In addition, it introduces the following custom [`monogres/*` branches]:

- `monogres/main`: the main branch of this mirror.
- `monogres/patches/<PG_VERSION>`: track the corresponding `REL_<PG_VERSION>`
  tag in the upstream (official) repo and includes the patches needed to be
  able to have a reproducible build.

> [!NOTE]
> **This repository solely exists to maintain a set of patches that enable
> Postgres reproducible builds**.
>
> The long-term goal is for these patches to be upstreamed. Once that happens,
> this mirror will no longer be needed for future PostgreSQL versions but it
> will remain available to support reproducible builds of older releases.

> [!IMPORTANT]
> **This repository only accepts issues, pull requests, and contributions
> related to the `monogres/*` branches**.
>
> To contribute to PostgreSQL itself, please refer to the [official PostgreSQL
> "Submitting a patch" wiki page]

<!-- Links -->

[Monogres]: https://github.com/monogres/monogres
[`monogres/*` branches]: https://github.com/monogres/postgres/branches/all?query=monogres
[official PostgreSQL repository]: https://git.postgresql.org/gitweb/?p=postgresql.git
[official PostgreSQL "Submitting a patch" wiki page]: https://wiki.postgresql.org/wiki/Submitting_a_Patch
[reproducible build]: https://reproducible-builds.org
