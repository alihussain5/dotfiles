# Personal conventions

## General

- **No comments ever.** No JSDoc blocks, no inline comments. Code explains itself.
- **Avoid standalone helper functions.** Keep logic as private methods on the class that uses it (`#method()`), not module-scope functions or constants.
  - `static #FIELD` breaks `@Injectable()` (TS18036) — inline the value instead.
- **Don't create your own types.** Derive from generated/source types (Prisma, Relay `__generated__`, GraphQL) instead of hand-writing interfaces that duplicate them.
- **Never write single-line `if`s.** Always use braces on separate lines — in code and in anything quoted back to the reader.
- **Query through MikroORM**, not Prisma, when resolving GraphQL fields.

## Frontend

- **Never assign JSX to a variable.** Inline components at every usage site, even if it means duplicating markup.
- **Prefer fragments** over passing data down through props or re-querying. Colocate a fragment with the component that renders it.

## Backend

- **Services accept IDs as params**, never entity objects: `{ fooId: string }`, and the service fetches the record itself.
