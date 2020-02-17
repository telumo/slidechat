/* eslint-disable */
// this is an auto generated file. This will be overwritten

export const getComment = `query GetComment($id: ID!) {
  getComment(id: $id) {
    id
    text
    command
    random
    commentedAt
  }
}
`;
export const listComments = `query ListComments(
  $filter: ModelCommentFilterInput
  $limit: Int
  $nextToken: String
) {
  listComments(filter: $filter, limit: $limit, nextToken: $nextToken) {
    items {
      id
      text
      command
      random
      commentedAt
    }
    nextToken
  }
}
`;
