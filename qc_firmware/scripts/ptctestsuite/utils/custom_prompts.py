import asyncio
import prompt_toolkit as ptk

# little helper for async y/n questions
async def async_yesno(prompt_session: ptk.PromptSession, message: str) -> bool:
    ans = await prompt_session.prompt_async(message + " (y/n): ")
    return ans.lower() in ('y', 'yes')