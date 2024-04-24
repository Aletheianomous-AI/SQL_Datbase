DECLARE @SpecificUserID INT = 1; -- We're setting the UserID to 1

SELECT
    ch.Chat_ID,
    ch.Chat_Content,
    ch.Time_Of_Output,
    conv.ConversationName,
    cc.Conversation_ID,
    conv.UserID
FROM
    dbo.Chat_History ch
JOIN
    dbo.Chat_Conversation cc ON ch.Chat_ID = cc.Chat_ID
JOIN
    dbo.Conversation conv ON cc.Conversation_ID = conv.ConversationID
WHERE
    conv.UserID = @SpecificUserID; -- Filters the results for the specific user
